class Regular < User

  include Budgetable
  include Closeable
  include Expireable
  include Packageable
  include WhitelabelSignable

  def active_model_serializer
    RegularSerializer
  end

  def transferee?; true; end
end
