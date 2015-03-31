class Ability
  include CanCan::Ability

  def initialize(user)
  	if user.nil?
  		can :read, :all
  	elsif user.admin?
    	can :manage, :all
	   else
		  can :read, :all
		  can [:update, :destroy], user, :id => user.id
	  end
  end
end