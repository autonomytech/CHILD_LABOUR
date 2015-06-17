class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|
      t.string :name

      t.timestamps null: false
    end
    Law.create([{ name: 'Child Labour' }, { name: 'POSCO' }\
    , { name: 'MAHA begging' }, { name: "Mumbai shop's & establishment" }])
  end
end
