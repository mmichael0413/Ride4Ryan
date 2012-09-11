class AddSettingIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :setting_id, :integer
  end
end
