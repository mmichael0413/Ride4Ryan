class AddStartDateToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :start_date, :date
  end
end
