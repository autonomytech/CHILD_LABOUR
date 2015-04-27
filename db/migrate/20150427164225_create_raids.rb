class CreateRaids < ActiveRecord::Migration
  def change
    create_table :raids do |t|
      t.string :title
      t.date :date
      t.time :time
      t.references :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :raids, :locations
    Raid.create([{ title: 'Raid 1', date: '27/04/2015', time: '14:00'\
      , location_id: 1 }\
    , { title: 'Raid 2', date: '28/04/2015', time: '16:00', location_id: 2 }\
    , { title: 'Raid 3', date: '29/04/2015', time: '10:00', location_id: 3 }\
    , { title: 'Raid 4', date: '30/04/2015', time: '11:00', location_id: 4 }\
    , { title: 'Raid 5', date: '01/05/2015', time: '14:00', location_id: 5 }\
    , { title: 'Raid 6', date: '02/05/2015', time: '17:00', location_id: 1 }\
    , { title: 'Raid 7', date: '03/05/2015', time: '11:00', location_id: 2 }\
    , { title: 'Raid 8', date: '04/05/2015', time: '09:00', location_id: 3 }\
    , { title: 'Raid 9', date: '05/05/2015', time: '08:00', location_id: 4 }\
    , { title: 'Raid 10', date: '06/05/2015', time: '15:00', location_id: 5 }\
    , { title: 'Raid 11', date: '07/05/2015', time: '19:00', location_id: 1 }\
    , { title: 'Raid 12', date: '08/05/2015', time: '20:00', location_id: 2 }\
    , { title: 'Raid 13', date: '08/05/2015', time: '14:00', location_id: 3 }])
  end
end
