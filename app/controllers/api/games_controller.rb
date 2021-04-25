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
      has_monster: [true, false].sample,
      has_escaped: false,
      has_loot: false,
    })
    @room.save!

    #dice roll for room loot probability
    dice_roll = Random.rand(1..10)
    if dice_roll < 5
      @room.update(has_loot: true)
      #generate the loot
    end

    if @room.has_monster == true
      #create a monster
      @monster = Monster.new({
        name: "Level" + Random.rand(1..20).to_s + "Swamp Skeleton",
        is_dead: false,
        # catch_phrase: "im-a gonna get ya!",
        # max_health: 10,
        # attack: 30,
        # defense: 5,
        room_id: @room.id,
      })

      @monster.save!
      #update room with monster
      @room.update({
        room_id: @monster.id,
      })
      if @room.has_loot == true
        #generate loot
      end
    end

    @game.update({
      current_room: @room.id, #assigns current game room to newly created
    })

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
      has_monster: [true, false].sample,
      has_escaped: false,
      has_loot: false,
    })
    @room.save!

    #dice roll for room loot probability
    dice_roll = Random.rand(1..10)
    if dice_roll < 5
      @room.update(has_loot: true)
      #generate the loot
    end
    #if room.has_monster is true create a monster
    if @room.has_monster == true
      #create a monster
      @monster = Monster.new({
        name: "Level" + " " + Random.rand(1..5).to_s + " " + "Swamp Skeleton",
        is_dead: false,
        # catch_phrase: "im-a gonna get ya!",
        # max_health: 10,
        # attack: 30,
        # defense: 5,
        room_id: @room.id,
      })
      #save the monster
      @monster.save!
      #update room with monster
      @room.update({
        monster_id: @monster.id,
      })
    end
    if @room.has_loot == true
      #generate loot
    end
    #then updates current game room
    @game.update({
      current_room: @room.id,
    })
    @game.save!

    render "game_info.json.jb"
  end
end
