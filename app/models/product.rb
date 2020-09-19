class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, length: { minimum: 2 }
  validates :description, length: { in: 2..500 }
  belongs_to :supplier
  has_many :category_products
  has_many :categories, through: :category_products

  has_many :images
  has_many :orders, through: :carted_products
  has_many :carted_products
end

def tax
  price * 0.9
end

def total
  price + tax
end
