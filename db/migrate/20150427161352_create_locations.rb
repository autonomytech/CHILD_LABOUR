class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name

      t.timestamps null: false
    end
    Location.create([{ name: "नवी मुंबई" }, { name: "दादर" }\
    , { name: "वांद्रे" }, { name: "गोरेगाव" }, { name: "अंधेरी" }])
  end
end
