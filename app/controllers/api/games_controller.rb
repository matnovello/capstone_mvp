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
      base_attack: 5,
    })
    @user.save
    #generates new room

    @room = Room.new({
      name: "Dungeon" + "" + Random.rand(1..20).to_s,
      game_id: @game.id, #assigns room to current game
    #randomly assigns monster to room
    })
    @room.save!

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
      #monster catch phrases
      @catch_phrases = [
        "'OoOooooOo I'm spooky and evil'",
        "'I bet you can't even click the Attack button. HA! '",
        "'If I wasn't so cold and evil all the time, I'd probably play the xylophone on my ribs'",
        "'I'm not like other text RPG enemies, I care about your feelings... What's your astrology sign? '",
        "'Pitiful Mortal! I shalt smiteth thine down the hades with my menicing pixelated image'",
        "'oh s***, um.. I'MA GONNA EAT YA'",

      ]
      @monster = Monster.new({
        name: Faker::Games::ElderScrolls.first_name + " " + " The Skeleton",
        is_dead: false,
        # catch_phrase: "im-a gonna get ya!",
        # max_health: 10,
        # attack: 30,
        # defense: 5,
        room_id: @room.id,
        base_health: 20,
        catch_phrase: @catch_phrases.sample,
      })
      #save the monster
      @monster.save!
      #update room with monster
      @room.update({
        monster_id: @monster.id,
      })
    end
    if @room.has_loot == true
      #right now this is hard coded to the first loot item..
      #************
      #logic for random loot
      #************
      @random_loot = Loot.order("RANDOM()").first
      @loot = @random_loot.clone
      @loot.update(room_id: @room.id)
      @room.update({
        loot_id: @loot.id,
      })
    end
    #then updates current game room
    @game.update({
      current_room: @room.id,
    })
    @game.save!

    render "game_info.json.jb"
  end
end
