class DemoRequestOp < Operation

  def create(params)
    DemoRequestForm.new(DemoRequest.new, params).tap do |demo_request|
      if demo_request.valid?
        demo_request.save
        DemoRequestMailer.new_request(demo_request.delegated).deliver_later
      end
    end
  end
end
