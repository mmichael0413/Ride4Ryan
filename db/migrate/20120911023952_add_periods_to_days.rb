class AddPeriodsToDays < ActiveRecord::Migration
  def change
    add_column :days, :periods, :integer
  end
end
