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
    Address.create([{ employer_id: 1 }, { employer_id: 2 }, { employer_id: 3 }\
      , { employer_id: 4 }, { employer_id: 5 }, { employer_id: 6 }\
      , { employer_id: 7 }, { employer_id: 8 }, { employer_id: 9 }\
      , { employer_id: 10 }, { employer_id: 11 }, { employer_id: 12 }\
      , { employer_id: 13 }])
  end
end
