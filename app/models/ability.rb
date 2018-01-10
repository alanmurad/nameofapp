class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new #guest user (not loggedin)
  	can :manage, User, id: user.id
  	if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end