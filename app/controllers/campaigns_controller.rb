class CampaignsController < ApplicationController

  api :GET, '/campaigns/:id'
  param :id, :number
  description "Get Campaign by id"
  def show
    json_response(Campaign.find(params[:id]))
  end

  api :GET, '/campaigns'
  param :id, :number
  def index
    json_response(Campaign.all)
  end

end
