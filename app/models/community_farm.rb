class CommunityFarm < ActiveRecord::Base
  belongs_to :raid
  belongs_to :department

  def involve_members
    return if involve_member.blank?
    involve_member.split(',').collect \
    { |i| { id: i, full_name: User.full_name(i), email: User.email(i) } }
  end

  def submited_by_user
    User.full_name(submited_by)
  end
end
