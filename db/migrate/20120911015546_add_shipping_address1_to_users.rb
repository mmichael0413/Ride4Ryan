class AddShippingAddress1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_address1, :text
  end
end
