class AddAttachmentPhotoToCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :customers, :photo
  end
end
