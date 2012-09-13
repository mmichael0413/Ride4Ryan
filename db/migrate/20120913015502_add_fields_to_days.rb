class AddFieldsToDays < ActiveRecord::Migration
  def change
    add_column :days, :date, :date
    add_column :days, :start_time, :datetime
    add_column :days, :end_time, :datetime
    add_column :days, :period_length, :integer
    add_column :days, :slots_per_period, :integer
    add_column :days, :fund_id, :integer
  end
end
