class AddFieldsToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :title, :string
    add_column :funds, :headline, :text
    add_column :funds, :content, :text
    add_column :funds, :admin_id, :integer
  end
end
