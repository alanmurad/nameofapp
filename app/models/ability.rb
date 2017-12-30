class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new #guest user (not loggedin)
  	if user.admin?
      can :manage, :all
    else
      can :read, :all
      cannot :manage, Product
    end
  end
end