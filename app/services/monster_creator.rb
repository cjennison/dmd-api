class MonsterCreator

  attr_reader :user, :params, :campaign

  def initialize(user, params, campaign=nil)
    @user = user
    @params = params
    @campaign = campaign
  end

  def create
    monster = Monster.new(params)
    monster.user = user
    
    # Optionally include campaign with monster
    if campaign.present?
      monster.campaign_assets << CampaignAsset.new({
        campaign: campaign,
        campaign_assetable: monster
      })
    end

    if monster.save
      monster
    end
  end

end