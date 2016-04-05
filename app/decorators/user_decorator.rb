class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def avatar
    image_tag(avatar_url, size: "100", alt: object.full_name)
  end

  private

  def avatar_url
    "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(object.email).downcase}.png"
  end
end
