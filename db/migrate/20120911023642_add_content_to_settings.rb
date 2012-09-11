class AddContentToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :content, :text
  end
end
