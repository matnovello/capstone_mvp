class Api::GamesController < ApplicationController
  def create
    @game = Game.new({})
    @game.save

    @user = User.new({
      name: params[:user_name],
      game_id: @game.id,
    })
    @user.save

    @room = Room.new({
      name: "Dungeon" + Random.rand(1..20).to_s,
      game_id: @game.id,

    })
    @room.save!

    @game.update({
      current_room: @room.id,
    })
    @game.save

    render "game_info.json.jb"
  end
end
