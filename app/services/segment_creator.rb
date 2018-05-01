class SegmentCreator

  attr_reader :campaign, :params

  def initialize(campaign, params)
    @campaign = campaign
    @params = params
  end

  def create
    segment = Segment.new(params)
    segment.key_url = Segment.generate_hash
    segment.campaign = campaign
    segment.save

    segment
  end

end