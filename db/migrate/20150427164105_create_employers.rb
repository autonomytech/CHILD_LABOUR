class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact_no
      t.references :raid, index: true
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
    add_foreign_key :employers, :raids
  end
end
