class Api::MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])
    render "monster_info.json.jb"
  end

  #attack method
  #if user attacks, monster is defeated
  def battle
    #makes the last user created calling method the one to attack... this could possibly break everything but we're gonna keep it for now, HAHA YEAAAH
    #user attack
    @user = User.last
    @attack_damage = @user.base_attack + Random.rand(1..5)
    @monster = Monster.find(params[:id])

    @monster.update({
      base_health: @monster.base_health - @attack_damage,
    })
    if @monster.base_health <= 0
      @monster.update({
        is_dead: true,
      })
      @user.update(monsters_defeated: @user.monsters_defeated + 1)
    end
    # monster attack
    @monster_attack_damage = @monster.base_attack + Random.rand(1..3)
    @user.update({ base_health: @user.base_health - @monster_attack_damage })
    if @user.base_health <= 0
      @user.update({
        is_dead: true,
      })
    end
    render "monster_info.json.jb"
  end
end
