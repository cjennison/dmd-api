class CampaignCreator

  attr_reader :user, :params

  def initialize(user, params)
    @user = user
    @params = params
  end

  def create
    campaign = Campaign.new(params)
    campaign.slug = Campaign.generate_slug(params[:name], user)
    campaign.user = user
    campaign.save

    campaign
  end

end