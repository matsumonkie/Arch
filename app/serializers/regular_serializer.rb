class RegularSerializer < UserSerializer

  attributes *%i[
    notes
  ]

  def notes
    [ whatever ]
  end

  def notes?
    regular?
  end
end
