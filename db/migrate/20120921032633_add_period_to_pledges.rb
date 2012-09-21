class AddPeriodToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :period, :integer
  end
end
