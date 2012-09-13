class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pledge_id, :integer
    add_column :orders, :product_id, :integer
    add_column :orders, :filled, :boolean
  end
end
