class CampaignsController < ApplicationController

  before_action :authenticate_user!

  api :GET, '/users/:user_id/campaigns'
  param :id, :number
  def show
    campaigns = user.campaigns
    json_response(campaigns)
  end

  api :POST, '/users/:user_id/campaigns'
  param :id, :number
  def create
    campaign = CampaignCreator.new(User.find(params[:user_id]), campaign_params).create
    json_response(campaign)
  end

  api :POST, '/campaigns/:campaign_id/:asset_type/:asset_id'
  param :id, :number
  def add_asset
    resource_class = params[:asset_type].classify.safe_constantize
    resource = resource_class.find(params[:asset_id])

    campaign = Campaign.find(params[:campaign_id])
    resource.campaign_assets << CampaignAsset.new({
      campaign: campaign,
      campaign_assetable: resource
    })

    json_response(resource)
  end

  private

  def user
    User.find(params[:user_id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :description)
  end

end
