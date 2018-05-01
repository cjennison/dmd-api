class MonsterUpdator

  attr_reader :monster, :params

  def initialize(monster, params)
    @monster = monster
    @params = params
  end

  def update
    monster.update_attributes(params)
    monster
  end
end
