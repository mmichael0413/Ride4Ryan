class AddTimeSpotsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :time_spots, :integer
  end
end
