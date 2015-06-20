class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role

      t.timestamps null: false
    end
    Role.create([{ role: "प्रशासक" }, { role: "सदस्य" }])
  end
end
