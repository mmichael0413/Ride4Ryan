class DropTimeslotTable < ActiveRecord::Migration
  def up
    drop_table :timeslots
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
