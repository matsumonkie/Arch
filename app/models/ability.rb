class Ability
  include CanCan::Ability

  def initialize(user)
    set_alias()
    set_abilities(user.type.to_sym)
  end

  def set_alias
    alias_action :create, :read, :update, :destroy, :to => :crud
  end

  def set_abilities(type)
    abilities = ABILITIES.call()
    abilities.fetch(type).each do |model, abilities|
      abilities = Array(abilities).map(&:to_sym)
      model = model.to_sym

      can(abilities, model)
    end
  end
end
