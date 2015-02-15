class AddAttachmentSigToCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.attachment :sig
    end
  end

  def self.down
    remove_attachment :customers, :sig
  end
end
