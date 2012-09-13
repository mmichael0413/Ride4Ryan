class AddFieldsToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :pledge_id, :integer
    add_column :timeslots, :day_id, :integer
    add_column :timeslots, :slot, :integer
  end
end
