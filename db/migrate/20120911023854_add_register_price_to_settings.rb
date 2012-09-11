class AddRegisterPriceToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :register_price, :integer
  end
end
