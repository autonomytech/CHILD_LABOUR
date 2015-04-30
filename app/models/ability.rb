class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, [Answer, ChildLabour, CommunityFarm, Employer] \
    if user.admin?
  end
end
