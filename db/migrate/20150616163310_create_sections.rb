class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.references :act, index: true

      t.timestamps null: false
    end
    add_foreign_key :sections, :acts
    Section.create([{ name: '3', act_id: 1 }, { name: '4', act_id: 1 }\
    , { name: '23', act_id: 2 }, { name: '26', act_id: 2 }\
    , { name: '34', act_id: 3 }, { name: '5', act_id: 3 }\
    , { name: '6', act_id: 3 }, { name: '7', act_id: 3 }\
    , { name: '8', act_id: 3 }, { name: '3', act_id: 4 }\
    , { name: '4', act_id: 4 }, { name: '5', act_id: 4 }\
    , { name: '6', act_id: 4 }, { name: '7', act_id: 4 }\
    , { name: '8', act_id: 4 }, { name: '5', act_id: 5 }\
    , { name: '9', act_id: 5 }, { name: '10', act_id: 5 }\
    , { name: '11', act_id: 5 }, { name: '11', act_id: 6 }])
  end
end
