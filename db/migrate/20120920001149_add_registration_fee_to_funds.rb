class AddRegistrationFeeToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :registration_fee, :integer
  end
end
