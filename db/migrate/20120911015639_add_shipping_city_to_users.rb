class AddShippingCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_city, :string
  end
end
