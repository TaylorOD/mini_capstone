require "minitest/autorun"

# Small, isolated authorization regression harness that loads the real controller.
# No database or Rails installation is required for these focused behavior tests.
class ApplicationController
  def self.before_action(*); end

  attr_accessor :params, :user
  attr_reader :rendered

  def current_user
    user
  end

  def render(**args)
    @rendered = args
  end
end

module Api
end

load File.expand_path("../../app/controllers/api/carted_products_controller.rb", __dir__)

class CartRemovalSecurityTest < Minitest::Test
  Item = Struct.new(:id, :status, :persisted_status, :save_result) do
    def save
      if save_result
        self.persisted_status = status
        true
      else
        false
      end
    end
  end

  class Scope
    def initialize(items)
      @items = items
    end

    def where(status:)
      Scope.new(@items.select { |item| item.status == status })
    end

    def find_by(id:)
      @items.find { |item| item.id.to_s == id.to_s }
    end
  end

  User = Struct.new(:carted_products)

  def item(id, status = "carted", save_result = true)
    Item.new(id, status, status, save_result)
  end

  def remove_for(user, id)
    controller = Api::CartedProductsController.new
    controller.user = user
    controller.params = { id: id }
    controller.destroy
    controller.rendered
  end

  def test_owner_can_remove_own_active_item
    owned = item(101)
    result = remove_for(User.new(Scope.new([owned])), "101")

    assert_equal "removed", owned.persisted_status
    assert_equal({ json: { status: "Carted product successfully removed!" } }, result)
  end

  def test_another_users_item_is_not_accessible
    victim_item = item(202)
    current_user = User.new(Scope.new([item(101)]))

    result = remove_for(current_user, "202")

    assert_equal "carted", victim_item.persisted_status
    assert_equal({ json: { error: "Cart item not found" }, status: :not_found }, result)
  end

  def test_purchased_item_cannot_be_removed
    purchased = item(101, "purchased")
    result = remove_for(User.new(Scope.new([purchased])), "101")

    assert_equal "purchased", purchased.persisted_status
    assert_equal :not_found, result.fetch(:status)
  end

  def test_unknown_item_returns_not_found
    result = remove_for(User.new(Scope.new([])), "missing")
    assert_equal :not_found, result.fetch(:status)
  end

  def test_failed_save_does_not_return_success
    unsaved = item(101, "carted", false)
    result = remove_for(User.new(Scope.new([unsaved])), "101")

    assert_equal "carted", unsaved.persisted_status
    assert_equal :unprocessable_entity, result.fetch(:status)
  end

  def test_delete_route_and_authentication_callback
    root = File.expand_path("../..", __dir__)
    routes = File.read(File.join(root, "config/routes.rb"))
    controller_source = File.read(File.join(root, "app/controllers/api/carted_products_controller.rb"))

    assert_includes routes, 'delete "/carted_products/:id" => "carted_products#destroy"'
    assert_includes controller_source, "before_action :authenticate_user"
    refute_match(/CartedProduct\.find_by/, controller_source)
  end
end
