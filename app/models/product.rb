class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, length: { minimum: 2 }
  validates :description, length: { in: 2..500 }
  belongs_to :supplier
  belongs_to :user
  has_many :images
  has_many :orders
end

def tax
  price * 0.9
end

def total
  price + tax
end
