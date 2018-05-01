class SegmentUpdator

  attr_reader :segment, :params

  def initialize(segment, params)
    @segment = segment
    @params = params
  end

  def update
    segment.update_attributes(params)
    segment
  end
end
