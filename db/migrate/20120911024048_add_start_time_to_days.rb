class AddStartTimeToDays < ActiveRecord::Migration
  def change
    add_column :days, :start_time, :datetime
  end
end
