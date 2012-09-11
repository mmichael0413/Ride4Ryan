class AddRiderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rider, :boolean
  end
end
