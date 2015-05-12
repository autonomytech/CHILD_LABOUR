class CreateRaids < ActiveRecord::Migration
  def change
    create_table :raids do |t|
      t.string :title
      t.datetime :datetime
      t.string :description
      t.string :raid_for
      t.references :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :raids, :locations
    Raid.create([{ title: 'Raid 1', datetime: '27/04/2015 14:00'\
      , location_id: 1, raid_for: 'Child Begger' }\
    , { title: 'Raid 2', datetime: '28/04/2015 16:00', location_id: 2, raid_for: 'Child Labour' }\
    , { title: 'Raid 3', datetime: '29/04/2015 10:00', location_id: 3, raid_for: 'Child Begger' }\
    , { title: 'Raid 4', datetime: '30/04/2015 11:00', location_id: 4, raid_for: 'Child Labour' }\
    , { title: 'Raid 5', datetime: '01/05/2015 14:00', location_id: 5, raid_for: 'Child Begger' }\
    , { title: 'Raid 6', datetime: '02/05/2015 17:00', location_id: 1, raid_for: 'Child Labour' }\
    , { title: 'Raid 7', datetime: '03/05/2015 11:00', location_id: 2, raid_for: 'Child Begger' }\
    , { title: 'Raid 8', datetime: '04/05/2015 09:00', location_id: 3, raid_for: 'Child Labour' }\
    , { title: 'Raid 9', datetime: '05/05/2015 08:00', location_id: 4, raid_for: 'Child Begger' }\
    , { title: 'Raid 10', datetime: '06/05/2015 15:00', location_id: 5, raid_for: 'Child Labour' }\
    , { title: 'Raid 11', datetime: '07/05/2015 19:00', location_id: 1, raid_for: 'Child Begger' }\
    , { title: 'Raid 12', datetime: '08/05/2015 20:00', location_id: 2, raid_for: 'Child Labour' }\
    , { title: 'Raid 13', datetime: '08/05/2015 14:00', location_id: 3, raid_for: 'Child Begger' }])
  end
end
