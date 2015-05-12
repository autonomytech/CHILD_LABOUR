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
    Employer.create([{ first_name: 'sachin', last_name: 'kale', raid_id: 1 }\
    , { first_name: 'kedar', last_name: 'khote', raid_id: 2 }\
    , { first_name: 'vaibhav', last_name: 'ughade', raid_id: 3 }\
    , { first_name: 'mangesh', last_name: 'shinde', raid_id: 4 }\
    , { first_name: 'ravi', last_name: 'patel', raid_id: 5 }\
    , { first_name: 'xyzv', last_name: 'vdsv', raid_id: 6 }\
    , { first_name: 'vtr', last_name: 'kfote', raid_id: 7 }\
    , { first_name: 'wwe', last_name: 'trrt', raid_id: 8 }\
    , { first_name: 'aas', last_name: 'wer', raid_id: 9 }\
    , { first_name: 'zcz', last_name: 'pcel', raid_id: 10 }\
    , { first_name: 'bhav', last_name: 'gde', raid_id: 11 }\
    , { first_name: 'gesh', last_name: 'shde', raid_id: 12 }\
    , { first_name: 'reravi', last_name: 'atel', raid_id: 13 }])
  end
end
