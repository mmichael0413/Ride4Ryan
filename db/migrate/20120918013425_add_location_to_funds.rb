class AddLocationToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :location, :text
  end
end
