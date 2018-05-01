class AssetsController < ApplicationController
  before_action :authenticate_user!
  
  api :GET, '/users/:user_id/characters'
  param :id, :number
  def characters_index
    characters = current_user.characters
    json_response(characters)
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

  api :DELETE, '/users/:user_id/itmes/:id'
  param :id, :number
  def item_destroy
    item = Item.find(params[:id])
    json_response(item.destroy)
  end
end
