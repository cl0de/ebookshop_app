class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, :limit => 255, :null => false
      t.string :isbn, :limit => 13, :unique => true
      t.text :description
      t.float :price
      t.string :cover_image

      t.timestamps null: false
    end
  end
end
