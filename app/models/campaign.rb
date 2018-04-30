class Campaign < ApplicationRecord
  belongs_to :user
  has_many :segments
  has_many :encounters

  has_many :campaign_assets
  belongs_to :campaign_assetable, polymorphic: true

  has_many :items, through: :campaign_assets, source: :campaign_assetable, source_type: 'Item'
  has_many :monsters, through: :campaign_assets, source: :campaign_assetable, source_type: 'Monster'
  has_many :characters, through: :campaign_assets, source: :campaign_assetable, source_type: 'Character'


  def self.generate_slug(name, user)
    prefix = user.last_name || user.id
    "#{prefix.parameterize}-#{name.parameterize}"
  end

  def has_user_permissions(user)
    self.user.id == user.id
  end
end
