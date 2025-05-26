class CreateStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.date :entry_date

      t.timestamps
    end
  end
end
