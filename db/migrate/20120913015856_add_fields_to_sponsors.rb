class AddFieldsToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :fund_id, :integer
    add_column :sponsors, :link_url, :string
  end
end
