# this class allows you to easily call any controller/action
# in development mode without having to deal with session or anything
#
# ex:
#   target: /api/user/current as an admin
#   fake_url: https://localhost:3000/as/a/api/users/current
#
class EasyQueryController < ApplicationController

  include Sessionable

  def as
    type = user_type(params[:type])
    create_session(type.first._id)
    redirect_to "/#{params[:route]}", status: :temporary_redirect
  end

  protected

  def user_type(type)
    case type.to_sym
    when :a then Admin
    when :r then Regular
    when :v then Visitor
    end
  end
end
