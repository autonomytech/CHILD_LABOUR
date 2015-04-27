class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name

      t.timestamps null: false
    end
    Location.create([{ name: 'Navi Mumbai' }, { name: 'Dadar' }\
    , { name: 'Bandra' }, { name: 'Goregaon' }, { name: 'Andheri' }])
  end
end
