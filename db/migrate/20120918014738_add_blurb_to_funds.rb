class AddBlurbToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :blurb, :text
  end
end
