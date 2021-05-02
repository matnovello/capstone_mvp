class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render "user.json.jb"
  end
end
