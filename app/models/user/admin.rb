class Admin < User

  def admin?; true; end
  def closed; false; end
end
