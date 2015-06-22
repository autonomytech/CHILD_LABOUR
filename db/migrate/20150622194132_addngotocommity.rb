class Addngotocommity < ActiveRecord::Migration
  def change
  	add_column :community_farms,:ngo_name,:string
  	add_column :community_farms,:person_name,:string
  end
end
