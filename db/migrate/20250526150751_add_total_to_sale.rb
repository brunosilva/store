class AddTotalToSale < ActiveRecord::Migration[7.2]
  def change
    add_column :sales, :total, :float
  end
end
