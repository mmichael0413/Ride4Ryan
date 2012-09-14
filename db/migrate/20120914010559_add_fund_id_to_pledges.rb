class AddFundIdToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :fund_id, :integer
  end
end
