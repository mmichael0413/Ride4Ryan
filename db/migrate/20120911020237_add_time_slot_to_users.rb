class AddTimeSlotToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_slot, :integer
  end
end
