class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :file
      t.references :raid, index: true
      t.references :child, index: true
      t.references :employer, index: true

      t.timestamps null: false
    end
    add_foreign_key :attachments, :raids
    add_foreign_key :attachments, :children
    add_foreign_key :attachments, :employers
  end
end
