class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|

      t.timestamps
    end
  end
end
