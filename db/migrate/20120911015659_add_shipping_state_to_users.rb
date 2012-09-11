class AddShippingStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_state, :string
  end
end
