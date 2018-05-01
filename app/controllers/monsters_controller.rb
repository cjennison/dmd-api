class MonstersController < ApplicationController
  before_action :authenticate_user!

  api :GET, '/campaigns/:campaign_id/monsters'
  param :id, :number
  def index
    monsters = campaign.monsters
    json_response(monsters)
  end

  api :POST, '/campaigns/:campaign_id/monsters'
  param :id, :number
  def create
    monster = MonsterCreator.new(current_user, monster_params, campaign).create
    json_response(monster)
  end

  api :GET, '/monsters/:id'
  param :id, :number
  def show
    monster = Monster.find(params[:id])
    json_response(monster)
  end

  api :PUT, '/monsters/:id'
  param :id, :number
  def update
    monster = Monster.find(params[:id])
    monster = MonsterUpdator.new(monster, monster_params).update
    json_response(monster)
  end

  api :DELETE, '/campaigns/:campaign_id/monsters/:id'
  param :id, :number
  def campaign_destroy
    campaign_asset = CampaignAsset.where(campaign: campaign, campaign_assetable: Monster.find(params[:id])).first
    if campaign_asset.destroy
      json_response(true)
    end
  end

  private

  def campaign
    Campaign.find(params[:campaign_id])
  end

  def monster_params
    params.require(:monster).permit(:name, :description, :hitpoints, :hit, :damage, :armor_class)
  end
end
