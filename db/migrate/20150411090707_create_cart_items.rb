class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :book, index: true
      t.references :cart, index: true
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 3


      t.timestamps 
    end
  end
end
