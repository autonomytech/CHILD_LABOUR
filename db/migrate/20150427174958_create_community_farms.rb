class CreateCommunityFarms < ActiveRecord::Migration
  def change
    create_table :community_farms do |t|
      t.references :raid, index: true
      t.references :department, index: true
      t.string :involve_member
      t.string :submited_by

      t.timestamps null: false
    end
    add_foreign_key :community_farms, :raids
    add_foreign_key :community_farms, :departments
  end
end
