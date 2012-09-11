class AddShippingZipcodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_zipcode, :string
  end
end
