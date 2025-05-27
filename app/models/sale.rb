class Sale < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  has_many :payments
end
