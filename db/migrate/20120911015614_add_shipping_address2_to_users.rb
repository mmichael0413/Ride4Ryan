class AddShippingAddress2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_address2, :text
  end
end
