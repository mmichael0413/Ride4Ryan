class AddAttachmentBackgroundToFunds < ActiveRecord::Migration
  def self.up
    change_table :funds do |t|
      t.has_attached_file :background
    end
  end

  def self.down
    drop_attached_file :funds, :background
  end
end
