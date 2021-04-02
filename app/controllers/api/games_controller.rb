class Api::GamesController < ApplicationController
  def create
    @user = User.new(name: params[:user])
    @user.save

    @game = Game.new({
      current_user: @user.id,
    })
    @game.save
    render json: { game: @game }
  end
end
