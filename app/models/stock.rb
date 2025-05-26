class Stock < ApplicationRecord
  validates :quantity, :entry_date, presence: true
  belongs_to :product
end
