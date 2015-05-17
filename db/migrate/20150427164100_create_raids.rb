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
  end
end
