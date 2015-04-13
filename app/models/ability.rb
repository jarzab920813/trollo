class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
  	if user.admin?
      #can :manage, :all
      can :read, :all
      can :create, User
      can [:update, :delete], User , :admin => false
      can [:update], user, :id => user.id
    elsif user.admin = 0
      can :read, :all
      can [:update, :destroy], user, :id => user.id
	   else
		  can :read, :all
	  end
  end
end