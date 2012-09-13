class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :amount, :integer
    add_column :products, :fund_id, :integer
  end
end
