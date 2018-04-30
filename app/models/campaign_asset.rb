class CampaignAsset < ApplicationRecord
  belongs_to :campaign_assetable, polymorphic: true
  belongs_to :campaign
end
