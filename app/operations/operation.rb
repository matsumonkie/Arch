class Operation

  def self.create(params)
    self.new().create(params)
  end

  def self.show(params)
    self.new().show(params)
  end

  def self.update(params)
    self.new().update(params)
  end

  def self.delete(params)
    self.new().delete(params)
  end
end
