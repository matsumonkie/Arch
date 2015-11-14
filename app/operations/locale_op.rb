class LocaleOp < Operation

  def switch_to_french(current_user)
    If(current_user) do |user|
      user.locale = "fr"
      user.save unless user.visitor?
    end
  end

  def switch_to_english(current_user)
    If(current_user) do |user|
      user.locale = "en"
      user.save unless user.visitor?
    end
  end
end
