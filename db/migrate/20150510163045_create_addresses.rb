class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :pincode
      t.references :employer, index: true
      t.references :raid, index: true
      t.references :child, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :employers
    add_foreign_key :addresses, :raids
    add_foreign_key :addresses, :children
  end
end
