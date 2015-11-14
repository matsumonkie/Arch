class AdminController < ApplicationController

  before_filter :check_admin

  def check_admin
    return render_forbidden unless @current_user.admin?
  end

  def index
    render layout: 'admin_application'
  end
end
