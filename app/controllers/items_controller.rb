class ItemsController < ApplicationController
  before_action :authenticate_user!

  api :GET, '/campaigns/:campaign_id/items'
  param :id, :number
  def index
    items = campaign.items
    json_response(items)
  end

  api :POST, '/campaigns/:campaign_id/items'
  param :id, :number
  def create
    item = ItemCreator.new(current_user, item_params, campaign).create
    json_response(item)
  end

  api :GET, '/items/:id'
  param :id, :number
  def show
    item = Item.find(params[:id])
    json_response(item)
  end

  api :PUT, '/items/:id'
  param :id, :number
  def update
    item = Item.find(params[:id])
    item = ItemUpdator.new(item, item_params).update
    json_response(item)
  end

  api :DELETE, '/campaigns/:campaign_id/items/:id'
  param :id, :number
  def campaign_destroy
    campaign_asset = CampaignAsset.where(campaign: campaign, campaign_assetable: Item.find(params[:id])).first
    if campaign_asset.destroy
      json_response(true)
    end
  end

  private

  def campaign
    Campaign.find(params[:campaign_id])
  end

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
