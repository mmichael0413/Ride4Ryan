class AddIconIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :icon_id, :integer
  end
end
