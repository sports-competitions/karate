class AccessPolicy
  include AccessGranted::Policy

  def configure

    role :admin, proc {|user| user && user.admin? } do
      can :manage, Person
      can :manage, Event
      can :manage, Register
    end

    role :registrator, proc {|user| user && user.registrator? } do
      can [:read, :update, :destroy], Person do |person, user|
        person.user == user
      end
    end
  end
end
