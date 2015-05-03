class CommunityFarm < ActiveRecord::Base
  belongs_to :raid
  belongs_to :department

  def involve_members
  	return if involve_member.blank?
  	involve_member.split(',').collect \
  	{ |i| {id: i, full_name: User.find(i).full_name, email: User.find(i).email} }
  end
end
