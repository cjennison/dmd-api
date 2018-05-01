class ItemCreator

  attr_reader :user, :params, :campaign

  def initialize(user, params, campaign=nil)
    @user = user
    @params = params
    @campaign = campaign
  end

  def create
    item = Item.new(params)
    item.user = user
    
    # Optionally include campaign with item
    if campaign.present?
      item.campaign_assets << CampaignAsset.new({
        campaign: campaign,
        campaign_assetable: item
      })
    end

    if item.save
      item
    end
  end

end