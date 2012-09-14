class AddFundIdToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :fund_id, :integer
  end
end
