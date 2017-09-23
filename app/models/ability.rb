class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new #guest user (not loggedin)
  	can :manage, User, id: user.id
  end
end
