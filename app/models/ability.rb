class Ability

  include CanCan::Ability

  def initialize(user, params = {})
    @params = params
    @user = user
    @id = user.id.to_s
    set_alias()
    set_abilities(user.type.to_sym)
  end

  def set_alias
    alias_action :create, :show, :index, :edit, :update, :destroy, :to => :crud
  end

  def set_abilities(type)
    case type
    when :admin      then admin()
    when :regular    then regular()
    else
      visitor()
    end
  end

  def common_abilities
    can [:index]             ,:users
  end

  def signed_user_abilities
    me = @user if(@params[:user_id] == @id)
    can [:update], :avatars do |_| me end
  end

  def admin_abilities
    can :manage, :all
  end

  def transferee_abilities
    me = @user if(@params[:user_id] == @id)

    can [:index, :create, :update, :destroy], :labeled_notes do |_|
      res = @params[:user_id] == @id
      unless @params[:id].blank?
        my_notes = (@user.notes.find(@params[:id]).author.id.to_s == @id)
        res = res && my_notes
      end
      res
    end
  end

  def visitor_abilities
    can [:confirm, :activate, :reset_password], :accounts
  end

  def admin
    common_abilities()
    signed_user_abilities()
    admin_abilities()
  end

  def regular
    common_abilities()
    signed_user_abilities()
  end

  def visitor
    common_abilities()
    visitor_abilities()
  end
end
