class AddSettingIdToDays < ActiveRecord::Migration
  def change
    add_column :days, :setting_id, :integer
  end
end
