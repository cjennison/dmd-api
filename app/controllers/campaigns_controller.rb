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

  private

  def user
    User.find(params[:user_id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :description)
  end

end
