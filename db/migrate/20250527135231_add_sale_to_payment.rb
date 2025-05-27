class AddSaleToPayment < ActiveRecord::Migration[7.2]
  def change
    add_reference :payments, :sale, null: false, foreign_key: true
  end
end
