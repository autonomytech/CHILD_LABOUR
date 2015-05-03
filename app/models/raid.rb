class Raid < ActiveRecord::Base
  belongs_to :location
  has_many :child_labours
  has_many :community_farms

  def community_farm_status
  	return 'Pending' if community_farms.blank?
  	return 'Pending' if community_farms.first.involve_member.blank?
  	'Completed'
  end

  def community_farm_blank?
    return true if community_farms.blank?
    false
  end
end
