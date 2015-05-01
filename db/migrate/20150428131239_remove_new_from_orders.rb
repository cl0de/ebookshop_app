class RemoveNewFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :new, :string
  end
end
