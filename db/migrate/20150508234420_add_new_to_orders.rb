class AddNewToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :new, :string
  end
end
