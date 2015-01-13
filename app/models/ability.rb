class Ability
  include CanCan::Ability

  def initialize(user)
    set_alias()
    set_abilities(user.type.to_sym)
  end

  def set_alias
    alias_action :create, :show, :index, :edit, :update, :destroy, :to => :crud
  end

  def set_abilities(type)
    case type
    when :admin   then admin()
    when :regular then regular()
    when :visitor then visitor()
    end
  end

  def common_abilities
    can :crud, :welcome
    can :create, :sessions
    can :show, :translations
    can :crud, :templates
    can [:crud, :current], :users
  end

  def signed_user_abilities
  end

  def admin_abilities
    can :manage, :all
  end

  def regular_abilities
  end

  def visitor_abilities
  end

  def admin
    common_abilities()
    signed_user_abilities()
    admin_abilities()
  end

  def regular
    common_abilities()
    signed_user_abilities()
    regular_abilities()
  end

  def visitor
    common_abilities()
    visitor_abilities()
  end
end
