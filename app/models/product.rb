class Product < ApplicationRecord
  validates :name, :price, presence: true

  belongs_to :category
  has_many :stocks
  has_many :sales

end
