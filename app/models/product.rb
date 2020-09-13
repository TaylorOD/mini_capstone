class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, length: { minimum: 2 }
  validates :description, length: { in: 2..500 }
  belongs_to :supplier
  has_many :images
end

def tax
  price * 0.09
end

def total
  price + tax
end
