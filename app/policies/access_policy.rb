class AccessPolicy
  include AccessGranted::Policy

  def configure

    role :admin, proc {|registrator| registrator && registrator.admin? } do
      can :manage, Person
      can :manage, Event
      can :manage, Register
    end

    role :user, proc {|registrator| registrator && registrator.user? } do
      can [:read, :update, :destroy], Person do |person, registrator|
        person.registrator == registrator
      end
    end
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    # role :admin, proc { |user| user.admin? } do
    #   can :destroy, User
    # end

    # More privileged role, applies to registered users.
    #
    # role :member, proc { |user| user.registered? } do
    #   can :create, Post
    #   can :create, Comment
    #   can [:update, :destroy], Post do |post, user|
    #     post.author == user
    #   end
    # end

    # The base role with no additional conditions.
    # Applies to every user.
    #
    # role :guest do
    #  can :read, Post
    #  can :read, Comment
    # end
  end
end
