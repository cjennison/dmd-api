class AssetsController < ApplicationController
  before_action :authenticate_user!
  
  api :GET, '/users/:user_id/characters'
  param :id, :number
  def characters_index
    characters = current_user.characters
    json_response(characters)
  end

  api :POST, '/users/:user_id/characters'
  param :id, :number
  def character_create
    character = CharacterCreator.new(current_user, character_params).create
    json_response(character)
  end

  api :DELETE, '/users/:user_id/characters/:id'
  param :id, :number
  def character_destroy
    character = Character.find(params[:id])
    json_response(character.destroy)
  end

  api :GET, '/users/:user_id/monsters'
  param :id, :number
  def monsters_index
    monsters = current_user.monsters
    json_response(monsters)
  end

  api :POST, '/users/:user_id/monsters'
  param :id, :number
  def monster_create
    monster = MonsterCreator.new(current_user, monster_params).create
    json_response(monster)
  end

  api :DELETE, '/users/:user_id/monsters/:id'
  param :id, :number
  def monster_destroy
    monster = Monster.find(params[:id])
    json_response(monster.destroy)
  end

  api :GET, '/users/:user_id/items'
  param :id, :number
  def items_index
    items = current_user.items
    json_response(items)
  end

  api :POST, '/users/:user_id/items'
  param :id, :number
  def item_create
    item = ItemCreator.new(current_user, item_params).create
    json_response(item)
  end

  api :DELETE, '/users/:user_id/itmes/:id'
  param :id, :number
  def item_destroy
    item = Item.find(params[:id])
    json_response(item.destroy)
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :biography, :hitpoints, :alignment, :race, :gender)
  end

  def item_params
    params.require(:item).permit(:name, :description)
  end

  def monster_params
    params.require(:monster).permit(:name, :description, :hitpoints, :hit, :damage, :armor_class)
  end
end
