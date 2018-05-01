class ItemUpdator

  attr_reader :item, :params

  def initialize(item, params)
    @item = item
    @params = params
  end

  def update
    item.update_attributes(params)
    item
  end
end
