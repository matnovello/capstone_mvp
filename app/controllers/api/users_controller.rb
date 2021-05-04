class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render "user.json.jb"
  end

  def show_loots
    @user = User.find(params[:id])
    render "user_loots.json.jb"
  end
end
