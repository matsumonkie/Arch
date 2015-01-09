class Ability
  include CanCan::Ability

  def initialize(user)
    set_alias()
    set_abilities(user)
  end

  def set_alias
    alias_action :create, :read, :update, :destroy, :to => :crud
  end

  def set_abilities(user)
    common_abilities()
    case user.type
    when :admin   then admin_abilities
    when :regular then regular_abilities
    when :visitor then visitor_abilities
    end
  end

  def common_abilities
    common_spec_abilities()
    can :show, :Template
    can :show, :Translations
    can :show, :Users
    can :index, :Users
    can :update, :Users
    can :edit, :Users
    can :index, :Welcome
  end

  def admin_abilities
    admin_spec_abilities()
    can :index, User
    can :show, User
    can :index, :Welcome
  end

  def regular_abilities
    regular_spec_abilities()
  end

  def visitor_abilities
    visitor_spec_abilities()
  end

  def admin_spec_abilities
    can :do_crazy_thing,   SpecModel
    can :do_regular_thing, SpecModel
    can :do_visitor_thing, SpecModel
  end

  def regular_spec_abilities
    can :do_regular_thing, SpecModel
    can :do_visitor_thing, SpecModel
  end

  def visitor_spec_abilities
    can :do_visitor_thing, SpecModel
  end

  def common_spec_abilities
    can :do_common_thing, SpecModel
  end
end
