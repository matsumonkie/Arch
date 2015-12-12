class RegularSerializer < UserSerializer

=begin
  attributes *%i[
    notes
  ]

  def notes
    [ whatever ]
  end

  def notes?
    regular?
  end
=end
end
