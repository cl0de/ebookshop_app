class CreateAuthorBooks < ActiveRecord::Migration
  def change
    create_table :author_books, :id => false do |t|
      t.integer :author_id, :integer, :null => false, index: true
      t.integer :book_id, :integer, :null => false, index: true

    end
  end
end
