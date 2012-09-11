class AddSlotsPerPeriodToDays < ActiveRecord::Migration
  def change
    add_column :days, :slots_per_period, :integer
  end
end
