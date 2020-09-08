class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numerricality: { greater_than: 0 }
  validates :name, length: { minimum: 2 }
  validates :description, length: { in: 2..500 }
  validates :id, uniqueness: true
end

def tax
  price * 0.09
end

def total
  price + tax
end
