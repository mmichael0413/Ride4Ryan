class AddEmailAddressToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :email_address, :string
  end
end
