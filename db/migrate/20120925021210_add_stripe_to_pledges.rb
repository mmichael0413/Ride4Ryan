class AddStripeToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :stripe_customer_token, :string
  end
end
