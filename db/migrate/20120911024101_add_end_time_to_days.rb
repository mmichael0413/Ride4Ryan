class AddEndTimeToDays < ActiveRecord::Migration
  def change
    add_column :days, :end_time, :datetime
  end
end
