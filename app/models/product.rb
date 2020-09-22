class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 2..500 }

  belongs_to :supplier

  has_many :images

  has_many :category_products
  has_many :categories, through: :category_products

  has_many :carted_products
  has_many :orders, through: :carted_products

  scope :title_search, ->(search_terms) { where("name ILIKE ?", "%#{search_terms}%") if search_terms }
  scope :discounted, ->(check_discount) { where("price < ?", 19) if check_discount }
  scope :sorted, ->(sort, sort_order) {
          if sort == "price" && sort_order == "asc"
            order(price: :asc)
          elsif sort == "price" && sort_order == "desc"
            order(price: :desc)
          else
            order(id: :asc)
          end
        }

  def friendly_updated_at
    updated_at.strftime("%B%e, %Y")
  end

  def is_discounted?
    price <= 19
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
