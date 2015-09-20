class AddAttachmentLogoToOrganisations < ActiveRecord::Migration
  def self.up
    change_table :organisations do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :organisations, :logo
  end
end
