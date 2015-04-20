class Ability
  include CanCan::Ability

  def initialize(user)
  	if user.nil?
  		can :read, :all
  	elsif user.admin?
    	can :manage, :all
	   else
		  can :read, :all
		  can :manage, User, :id => user.id
      # tutaj przykładowo zwykły użytkownik może tylko podejrzeć użytkowników
		  can :read, User
		  can [:update, :destroy], user, :id => user.id
	  end
  end
end