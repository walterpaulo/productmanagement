class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :purchase_price
      t.float :sale_price

      t.timestamps
    end
  end
end
