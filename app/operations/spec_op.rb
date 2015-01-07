class SpecOp < Operation

  def index(params)
    []
  end

  def show(params)
    {}
  end

  def edit(params)
    {}
  end

  def update(params)
    {}
  end

  private

  def whitelist(params)
    params
  end
end
