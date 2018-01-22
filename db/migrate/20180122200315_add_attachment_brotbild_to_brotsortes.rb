class AddAttachmentBrotbildToBrotsortes < ActiveRecord::Migration
  def self.up
    change_table :brotsortes do |t|
      t.attachment :brotbild
    end
  end

  def self.down
    remove_attachment :brotsortes, :brotbild
  end
end
