class User < ActiveRecord::Base

  class << self
    def from_omniauth(auth_hash)
      raise '401' if !auth_hash['info'].email.end_with? '@klarna.com'

      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['name']
      user.location = auth_hash['info']['location']
      user.image_url = auth_hash['info']['image']
      # user.url = auth_hash['info']['urls'][user.provider.capitalize]
      user.save!
      user
    end

    def from_uid(uid)
      User.find_by(uid: uid)
    end
  end

  def can_open?
    return true if provider == 'Google'

    start_date <= DateTime.now && DateTime.now <= end_date
  end
end
