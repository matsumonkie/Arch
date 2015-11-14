# the If module is just a helper method to tap and validate object
#
# If(User.find("some_id") do |user|
#   user.firstname = "coucou"
# end
#
# is equivalent to
#
# user = User.find("some_id")
# if user
#   user.firstname = "coucou"
# end
# return user
#
# see if_spec.rb for more details on how it works

module If

  def If(object, &block)
    TapAndEnterIfValid.new(object).call(&block)
  end

  def Return(object)
    TapAndEnterIfValid::Return.new(object)
  end

  class TapAndEnterIfValid

    class IfWrapper < SimpleDelegator
      def delegated
        __getobj__
      end
    end

    class Return < IfWrapper
    end

    def initialize(object)
      @object = IfWrapper.new(object)
    end

    def call(&block)
      if valid?
        res = yield @object

        if res.is_a? IfWrapper
          res
        else
          @object
        end
      else
        @object
      end
    end

    def valid?
      if @object.respond_to?(:valid?)
        @object.valid?
      else
        @object.delegated
      end
    end
  end
end
