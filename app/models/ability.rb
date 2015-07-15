class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user (not logged in)
    if user.admin?
      can :manage, :all
    else #role is anything but admin or role is nil
      can :manage, Order, :user_id => user.id
      can :manage, LineItem, :order => { :user_id => user.id }
      can :show, Trip
      #Allows trip leader to...
      can :manage, Trip, :leader => { :id => user.id } #...manage trips where he is the leader.
      can :manage, Order, :trip => { :leader => { :id => user.id } }#...manage orders for trip wher he is leader.
      can :manage, LineItem, :order => { :trip => { :leader => { :id => user.id } } }#...manage line items...
    end
    # Define abilities for the passed in user here. For example:
    #
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
