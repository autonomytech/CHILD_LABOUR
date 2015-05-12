class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :mother_name
      t.string :gender
      t.integer :age
      t.boolean :is_child_begger, default: false
      t.references :employer, index: true
      t.references :raid, index: true
      t.text :description
      t.boolean :is_deleted, default: false
      t.string :submited_by

      t.timestamps null: false
    end
    add_foreign_key :children, :employers
    add_foreign_key :children, :raids
  end
end
