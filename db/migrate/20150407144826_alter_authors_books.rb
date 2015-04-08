class AlterAuthorsBooks < ActiveRecord::Migration
  def change
    rename_table("author_books", "authors_books")
  end
end
