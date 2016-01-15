class UserForm < Form

  MODEL = :user
  WHITELIST = :firstname

  #  constraint: ->() { firstname.present? }
  coerce :firstname
  coerce :b, :c

  def firstname
    Error(:firstname, :not_valid) if true
  end

  def b
    puts "in b"
  end

  def c
    puts "in c"
  end
end
