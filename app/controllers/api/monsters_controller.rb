class Api::MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])
    render "monster_info.json.jb"
  end

  #attack method
  #if user attacks, monster is defeated
  def user_attack
    @monster = Monster.find(params[:id])
    @monster.update({ is_dead: true })
    render "monster_info.json.jb"
  end
end
