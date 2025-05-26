class AddProductToSales < ActiveRecord::Migration[7.2]
  def change
    add_reference :sales, :product, null: false, foreign_key: true
  end
end
