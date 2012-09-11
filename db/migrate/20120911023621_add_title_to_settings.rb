class AddTitleToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :title, :string
  end
end
