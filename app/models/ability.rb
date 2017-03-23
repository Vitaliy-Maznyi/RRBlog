class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, Post, user_id: user.id
    can [:create, :destroy], Comment, user_id: user.id
    can [:create, :destroy], Comment, Post: {user_id: user.id}
  end
end
