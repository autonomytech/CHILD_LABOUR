class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.references :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :departments, :locations
    Department.create([{ name: "नवी मुंबई पोलिस स्टेशन", location_id: 1 }\
    , { name: "दादर पोलिस स्टेशन", location_id: 2 }\
    , { name: "वांद्रे पोलिस स्टेशन", location_id: 3 }\
    , { name: "गोरेगाव पोलिस स्टेशन", location_id: 4 }\
    , { name: "अंधेरी पोलिस स्टेशन", location_id: 5 }])
  end
end
