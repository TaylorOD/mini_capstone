class AddProductsQuantity < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :quantity, :integer
  end
end
