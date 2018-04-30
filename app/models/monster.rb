class Monster < ApplicationRecord
  belongs_to :user
  has_many :campaign_assets, as: :campaign_assetable
  has_many :campaigns, through: :campaign_assets
end
