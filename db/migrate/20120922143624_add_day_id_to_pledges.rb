class AddDayIdToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :day_id, :integer
  end
end
