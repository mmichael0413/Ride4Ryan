class AddEndDateToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :end_date, :date
  end
end
