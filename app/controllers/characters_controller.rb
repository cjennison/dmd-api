class CharactersController < ApplicationController
  before_action :authenticate_user!

  api :GET, '/campaigns/:campaign_id/characters'
  param :id, :number
  def index
    characters = campaign.characters
    json_response(characters)
  end

  api :POST, '/campaigns/:campaign_id/characters'
  param :id, :number
  def create
    character = CharacterCreator.new(current_user, character_params, campaign).create
    json_response(character)
  end

  api :GET, '/characters/:id'
  param :id, :number
  def show
    character = Character.find(params[:id])
    json_response(character)
  end

  api :PUT, '/characters/:id'
  param :id, :number
  def update
    character = Character.find(params[:id])
    character = CharacterUpdator.new(character, character_params).update
    json_response(character)
  end

  api :DELETE, '/campaigns/:campaign_id/characters/:id'
  param :id, :number
  def campaign_destroy
    campaign_asset = CampaignAsset.where(campaign: campaign, campaign_assetable: Character.find(params[:id])).first
    if campaign_asset.destroy
      json_response(true)
    end
  end

  private

  def campaign
    Campaign.find(params[:campaign_id])
  end

  def character_params
    params.require(:character).permit(:name, :description, :biography, :hitpoints, :alignment, :race, :gender)
  end
end
