class AddSlotToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :slot, :integer
  end
end
