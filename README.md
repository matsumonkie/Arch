Arch
====

Arch is my vision of a good architecture for a backend app.
The architecture focus on decoupled module to have a clear distinction on every part of the app.
This distinction make it easier to code/improve/test/debug. This is how it is being separated
- abilities
- controllers
- forms
- models
- operations
- roles
- serializers

** Controllers **

I like thin controllers, meaning I don't want my controllers to take a lot of responsability and be a complete mess.
Controllers take the responsability of security/authentication and rendering, that's all they do
Security is done via models/ability.rb and look like that:

{% highlight ruby %}
class Ability

  include CanCan::Ability

  def initialize(user, params = {})
    @params = params
    @user = user
    @id = user.id.to_s
    set_abilities(user.type.to_sym)
  end

  def set_abilities(type)
    case type
    when :admin    then admin()
    when :regular  then regular()
    else
      visitor()
    end
  end

  def regular_abilities
    me = @user if(@params[:user_id] == @id)

    # notes abilities for user
    can [:index, :create, :update, :destroy], :notes do |_|
      my_notes = (@user.notes.find(@params[:id]))
      me && my_notes
    end
  end
{% endhighlight %}

depending on the ability to handle a note, the controller will either return a 403 forbidden or keep on processing the request

Regarding the rendering, the controller will take the result of an Operation and render it depending on its status. Serialization is done with [active serializer](https://github.com/rails-api/active_model_serializers)

{% highlight ruby %}
class Api::UsersController < ApplicationController

  def index
    render_for UserOp.index(params) # will render a json representation of the value return by UserOp.index(...)
  end
end
{% endhighlight %}

** Models **

Models should also be thin.
They usually only include concerns or attributes read only methods. Every methods that mutate the model will not be directly included in the model.

{% highlight ruby %}
# This is a typical class using Mongoid
class User

  include Role
  include Mongoid::Document
  include Mongoid::Timestamps

  include Passwordable

  field :email     ,type: String, default: ""
  field :firstname ,type: String
  field :lastname  ,type: String
end

{% endhighlight %}

See how thin the model is. So how would you interact with an object ? Here comes the Role!
We must include the module Role in every models to be able to use it.

** Role **

A role is a set of methods that you can inject at runtime in a model.
The idea is to enhance a model with a specific set of methods temporarily at runtime.
For example, for a user you might want to encrypt its password when he signs up.

{% highlight ruby %}
module PasswordRole

  def encrypt_password(unencrypted_password)
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password = encrypt(unencrypted_password, self.salt)
  end

  def encrypt(string, salt)
    BCrypt::Engine.hash_secret(string, salt)
  end
end
{% endhighlight %}

Those methods will help do the job without polluting the model.
Injecting a role is quite easy. You just need to call the play function with its associated role.

{% highlight ruby %}
  user.play(PasswordRole) do |user_with_role|
    user_with_role.encrypt_password(password)
    user_with_role.save
  end
{% endhighlight %}

But this injection should be done in an operation.

** Operation **

Operation are where everything are bound and operate.
An operation is the business part of the application, it will instantiate/edit/delete the models, bind them to roles, call external services, ...

{% highlight ruby %}
# An operation needs to inherits the Operation class
class PasswordOp < Operation

  def encrypt(user, password)
    user.play(PasswordRole) do |user|
      user.encrypt_password(password)
      user.save
    end
  end
{% endhighlight %}

** Form **

Form are yet another independent module that helps validate data
Form are still a WIP but this is basically how it should work eventually.

{% highlight ruby %}
class UserForm < Form

  MODEL = :user
  WHITELIST = :firstname

  coerce :firstname # name of the methods that will validate the model

  def firstname
    if self.firstname.empty?
      Error(:firstname, :not_valid)
    end
  end
end
{% endhighlight %}

Which you can bind a form, a request params and a specific model like this
{% highlight ruby %}
Form(UserForm, user, params).bind -> (form) {
  # this will only be executed if the form is valid
  form.model.save
  form
}
{% endhighlight %}
