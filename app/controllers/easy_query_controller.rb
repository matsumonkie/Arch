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
    open_session(DemoUser.first)
    type = user_type(params[:type])
    change_role(type)

    redirect_to "/#{params[:route]}"
  end

  protected

  def open_session(user)
    create_session(user._id)
  end

  def change_role(type)
    demo_user_params = { demo_user: { role: type } }
    DemoUserOp.update(demo_user_params)
  end

  def user_type(type)
    case type.to_sym
    when :a then 'Admin'
    when :r then 'Regular'
    when :v then 'Visitor'
    end
  end
end