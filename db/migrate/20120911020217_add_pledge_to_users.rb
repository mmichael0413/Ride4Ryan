class AddPledgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pledge, :boolean
  end
end
