module Avatarable
  extend ActiveSupport::Concern

  AVATAR_ASSET_FOLDERS = '/avatars'

  included do
    field :avatar, type: String, default: "default.png"
  end

  def create_avatar_dir
    FileUtils.mkdir_p(File.join(Rails.root, 'public', AVATAR_ASSET_FOLDERS))
  end

  def create_avatar(content)
    self.avatar = "#{Digest::MD5.hexdigest(email)}.jpeg"
    path = File.join(create_avatar_dir(), avatar)
    File.write(path, content)
  end

  def avatar_url
    "#{AVATAR_ASSET_FOLDERS}/#{avatar}"
  end
end
