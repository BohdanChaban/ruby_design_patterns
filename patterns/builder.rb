class PlayerBuilder
  attr_accessor :player

  def initialize(name)
    @player = Player.new(name)
  end

  def equip_boots(colour = @player.favourite_colour)
    @player.boots = Boots.new(colour)
  end

  def equip_jersey(number)
    @player.jersey = Jersey.new(@player.name, number)
  end

  def equip_gloves(colour = @player.favourite_colour)
    p 'oops' && return if @player.role == 'goalkeeper'
    @player.gloves = Gloves.new(colour)
  end
end

class Player
  attr_accessor :boots, :jersey, :gloves,
                :favourite_colour, :name, :role
  attr_reader :info

  ROLES = %w(goalkeeper defender midfielder forward)
  COLOURS = %w(red green blue yellow black)

  def initialize(name)
    @name = name
    @role = ROLES.sample
    @favourite_colour = COLOURS.sample
  end

  def info
    p "Name: #{@name}, role: #{@role}"
  end
end

class Boots
  attr_accessor :colour

  def initialize(colour)
    @colour = colour
  end

  def show
    p "I have #{@colour} boots"
  end
end

class Jersey
  attr_accessor :title, :number

  def initialize(title, number)
    @title = title
    @number = number
  end

  def show
    p "I have jersey with #{@number} number and my name #{@title} on it"
  end
end

class Gloves
  attr_accessor :colour

  def initialize(colour)
    @colour = colour
  end

  def show
    p "I have #{@colour} gloves"
  end
end

player_builder = PlayerBuilder.new('Shevchenko')
player_builder.player.info

player_builder.equip_boots
player_builder.equip_jersey(7)
player_builder.equip_gloves('pink')

player_builder.player.jersey.show
player_builder.player.boots.show
player_builder.player.gloves.show
