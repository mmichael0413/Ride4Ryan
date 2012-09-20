class AddPeriodToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :period, :integer
  end
end
