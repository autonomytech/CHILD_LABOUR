class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.references :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :departments, :locations
    Department.create([{ name: 'Navi Mumbai Police Station', location_id: 1 }\
    , { name: 'Dadar Police Station', location_id: 2 }\
    , { name: 'Bandra Police Station', location_id: 3 }\
    , { name: 'Goregaon Police Station', location_id: 4 }\
    , { name: 'Andheri Police Station', location_id: 5 }])
  end
end
