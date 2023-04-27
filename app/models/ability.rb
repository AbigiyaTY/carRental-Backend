class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Car
    return unless user.present?

    if user.admin?
      can :manage, :all
    else
      can %i[read update delete], User, id: user.id
      can :read, Reservation, user_id: user.id
      can :create, Reservation
      can :delete, Reservation do |reserved|
        reserved.start_date < Date.now
      end
      can :create, Car
    end
  end
end
