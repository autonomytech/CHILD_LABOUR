class CreateChildLabours < ActiveRecord::Migration
  def change
    create_table :child_labours do |t|
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.text :address
      t.integer :age
      t.references :employer, index: true
      t.references :raid, index: true
      t.text :description
      t.boolean :is_deleted, default: false
      t.string :submited_by

      t.timestamps null: false
    end
    add_foreign_key :child_labours, :employers
    add_foreign_key :child_labours, :raids
  end
end
