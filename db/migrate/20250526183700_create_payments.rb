class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.float :value
      t.string :method

      t.timestamps
    end
  end
end
