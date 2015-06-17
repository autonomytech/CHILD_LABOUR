class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.references :law, index: true

      t.timestamps null: false
    end
    add_foreign_key :acts, :laws
    Act.create([{ name: '1986', law_id: 1 }, { name: '2000', law_id: 1 }\
    , { name: '2012', law_id: 1 }, { name: '2012', law_id: 2 }\
    , { name: '1959', law_id: 3 }, { name: '1945', law_id: 4 }])
  end
end
