class Api::UserLootsController < ApplicationController
  def add_to_inventory
    @user_loot = UserLoot.new(user_id: params[:user_id], loot_id: params[:loot_id])
    @user_loot.save
    render "user_loot.json.jb"
  end
end
