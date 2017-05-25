class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       #user ||= User.new # guest user (not logged in)
      #user= current_user



       if user.joins(:roles).where({ roles: { name: "Jury" } }).any?
         can :manage, Gradework
       else
         can :read, :all
       end

       if user.joins(:roles).where({ roles: { name: "Administrator" } }).any?
         can :manage, :all
       else
         can :read, :all
       end

       if user.joins(:roles).where({ roles: { name: "Director" } }).any?
         can :manage, Gradework
       else
         can :read, :all
       end

       if user.joins(:roles).where({ roles: { name: "Student" } }).any?
         can :manage, Gradework
       else
         can :read, :all
       end

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
