class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.text :address
      t.string :contact_no
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
  end
end
