class Regular < User

  def active_model_serializer
    RegularSerializer
  end

  def regular?; true; end
end
