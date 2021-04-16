class Api::GamesController < ApplicationController
  def create
    # generates new game
    @game = Game.new({})
    @game.save
    #generates new user
    @user = User.new({
      name: params[:user_name],
      game_id: @game.id, #assigns user to current game
      base_health: 50,
    })
    @user.save
    #generates new room
    @room = Room.new({
      name: "Dungeon" + "" + Random.rand(1..20).to_s,
      game_id: @game.id, #assigns room to current game
      #randomly assigns monster to room
      has_monster?: [true, false].sample,

    })
    @room.save!

    @game.update({
      current_room: @room.id, #assigns current game room to newly created
    })
    @game.save

    render "game_info.json.jb"
  end

  def show
    @game = Game.find_by(id: params[:id])

    render "game_info.json.jb"
  end

  def update
    @game = Game.find_by(id: params[:id])
    #creates new room
    @room = Room.new({
      name: "Dungeon" + "" + Random.rand(1..20).to_s,
      game_id: @game.id,

    })
    @room.save!
    #then updates current game room
    @game.update({
      current_room: @room.id,
    })
    @game.save

    render "game_info.json.jb"
  end
end
