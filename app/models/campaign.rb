class Campaign < ApplicationRecord
  belongs_to :user

  def self.generate_slug(name, user)
    prefix = user.last_name || user.id
    "#{prefix.parameterize}-#{name.parameterize}"
  end

  def has_user_permissions(user)
    self.user.id == user.id
  end
end
