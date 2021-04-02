class Api::GamesController < ApplicationController
  def create
    @game = Game.new({})
    @game.save

    @user = User.new({
      name: params[:user_name],
      game_id: @game.id,
    })
    @user.save!

    render "game_info.json.jb"
  end
end
