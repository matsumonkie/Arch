class Operation

  def self.method_missing(method, *args, &block)
    if respond_to_missing?(method)
      define_dynamic_operation(method)
      self.send(method, args.first, &block)
    else
      super
    end
  end

  def self.respond_to_missing?(method_name, include_private = false)
    self.new().respond_to?(method_name)
  end

  protected

  def self.define_dynamic_operation(method)
    class_eval <<-RUBY
      def self.#{method}(params)
        self.new().#{method}(params)
      end
    RUBY
  end
end
