class Form < SimpleDelegator

  include ActiveModel::Validations

  def initialize(object, params = {})
    super(object)
    @model_errors = ActiveModel::Errors.new({})
    if object then attributes(params) else model_not_found end
  end

  def valid?
    if @model_errors.any? then false else super end
  end

  def errors
    if @model_errors.any? then model_not_found() else super end
  end

  def model_not_found(model_errors = {})
    model_errors.each { |key, value| @model_errors.add(key, value) }
  end

  def attributes(params)
    self.attributes = whitelist(params)
  end

  def delegated
    __getobj__
  end

  def tip
    inside_form = yield self
    if inside_form.is_a? Form
      inside_form
    else
      self
    end
  end

  protected

  def whitelist(params)
    ActionController::Parameters.new(params)
  end
end
