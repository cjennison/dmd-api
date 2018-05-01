class SegmentsController < ApplicationController
  before_action :authenticate_user!

  api :GET, '/campaigns/:campaign_id/segments'
  param :id, :number
  def index
    segments = campaign.segments
    json_response(segments)
  end

  api :POST, '/campaigns/:campaign_id/segments'
  param :id, :number
  def create
    segment = SegmentCreator.new(campaign, segment_params).create
    json_response(segment)
  end

  api :PUT, '/campaigns/:campaign_id/segments/:id'
  param :id, :number
  def update
    segment = Segment.find(params[:id])
    segment = SegmentUpdater.new(segment, segment_params).update
    json_response(segment)
  end

  private

  def campaign
    Campaign.find(params[:campaign_id])
  end

  def segment_params
    params.require(:segment).permit(:name, :description)
  end
end
