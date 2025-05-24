class Product < ApplicationRecord
  validates :name, :price, presence: true

  belongs_to :category
end
