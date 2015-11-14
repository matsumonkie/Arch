module SetUtil

  module_function

  def same?(array1, array2)
    (Set.new(array1) ^ Set.new(array2)).empty?
  end
end
