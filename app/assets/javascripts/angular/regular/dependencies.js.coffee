@regular_dependencies = [
  #foo1
  []

  #foo2
  [] 


].reduce (a, b) -> a.concat b
