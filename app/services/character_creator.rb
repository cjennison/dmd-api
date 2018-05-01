class CharacterCreator

  attr_reader :user, :params, :campaign

  def initialize(user, params, campaign=nil)
    @user = user
    @params = params
    @campaign = campaign
  end

  def create
    character = Character.new(params)
    character.user = user
    
    # Optionally include campaign with item
    if campaign.present?
      character.campaign_assets << CampaignAsset.new({
        campaign: campaign,
        campaign_assetable: character
      })
    end

    if character.save
      character
    end
  end

end