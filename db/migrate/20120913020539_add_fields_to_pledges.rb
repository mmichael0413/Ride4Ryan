class AddFieldsToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :first_name, :string
    add_column :pledges, :last_name, :string
    add_column :pledges, :shipping_address1, :string
    add_column :pledges, :shipping_address2, :string
    add_column :pledges, :shipping_city, :string
    add_column :pledges, :shipping_state, :string
    add_column :pledges, :shipping_zipcode, :string
    add_column :pledges, :amount, :integer
    add_column :pledges, :opt_out, :boolean
  end
end
