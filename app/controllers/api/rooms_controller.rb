class Api::RoomsController < ApplicationController
  #run method
  def user_run
    @room = Room.find(params[:id])
    dice_roll = Random.rand(1..8)
    if dice_roll > 3
      @room.update(has_escaped: true)
    end
    render "room_info.json.jb"
  end
end
