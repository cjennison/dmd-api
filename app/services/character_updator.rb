class CharacterUpdator

  attr_reader :character, :params

  def initialize(character, params)
    @character = character
    @params = params
  end

  def update
    character.update_attributes(params)
    character
  end
end
