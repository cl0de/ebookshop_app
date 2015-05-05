class RemoveCoverImageFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :cover_image, :string
  end
end
