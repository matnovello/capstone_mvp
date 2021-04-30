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
      is_dead: false,
    })
    @user.save
    #generates new room
    @inventory = LootStash.new(user_id: @user.id)
    @inventory.save

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
    #resets user health
    @user = User.last
    @user.update(base_health: 50)
    #creates new room
    @room = Room.new({
      name: "Dungeon" + "" + Random.rand(1..20).to_s,
      game_id: @game.id,
      has_monster: [true, false].sample,
      has_escaped: false,
      has_loot: false,
    })
    @room.save!

    #LOOT NOTES START HERE

    #dice roll for room loot probability
    dice_roll = 5
    # Random.rand(1..10)
    if dice_roll == 5
      @room.update(has_loot: true)
      @random_loot = Loot.order("RANDOM()").first
      @loot = @random_loot.clone
      @room.update({ loot_id: @loot.id })
      @room.loot = @loot
    end

    #LOOT NOTES END HERE

    if @room.has_monster == true
      #create a monster
      #monster catch phrases
      @catch_phrases = [
        "'OoOooooOo I'm spooky and evil'",
        "'I'm not like other text RPG enemies, I care about your feelings... What's your astrology sign? '",
        "'Pitiful Mortal! I shalt smiteth thine down with this menacing pixelated sprite",
        "'oh s***, um.. I'MA GONNA EAT YA'",

      ]
      @monster_titles = [
        "The Wise",
        "Of The Darkness",
        "The One Without A Cool Title",
        "Of Mayo For Sweat",
      ]
      @monster = Monster.new({
        name: Faker::Games::ElderScrolls.first_name + ", " + @monster_titles.sample,
        is_dead: false,
        # catch_phrase: "im-a gonna get ya!",
        # max_health: 10,
        # attack: 30,
        # defense: 5,
        room_id: @room.id,
        base_health: 20,
        base_attack: 5,
        catch_phrase: @catch_phrases.sample,
      })
      #save the monster
      @monster.save!
      #if room.has_monster is true create a monster
      #update room with monster
      @room.update({
        monster_id: @monster.id,
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
