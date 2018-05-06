class AssetSearcher

  attr_reader :query, :user

  def initialize(query, user)
    @query = query
    @user = user
  end

  def execute
    name = query[:name]
    type = query[:type]

    type.safe_constantize.where('name LIKE ?', "%#{name}%")
  end
end