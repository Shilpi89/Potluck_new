class AddAttachmentMenuToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :menu
    end
  end

  def self.down
    drop_attached_file :events, :menu
  end
end
