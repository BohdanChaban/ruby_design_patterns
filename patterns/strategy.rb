class Player
  def initialize(main_skill)
    @main_skill = main_skill
  end

  def skill_level
    @main_skill.show
  end

  def train
    @main_skill.improve
  end
end

class Pass
  attr_accessor :level

  def initialize
    @level = (3..8).to_a.sample
  end

  def improve
    @level += 1
  end

  def show
    puts @level
  end
end

class Kick
  attr_accessor :level

  def initialize
    @level = (4..7).to_a.sample
  end

  def improve
    @level += 2
  end

  def show
    puts @level
  end
end

class Defense
  attr_accessor :level

  def initialize
    @level = (5..9).to_a.sample
  end

  def improve
    @level += 1
  end

  def show
    puts @level
  end
end

Player.new(Defense.new).skill_level
Player.new(Pass.new).skill_level
Player.new(Kick.new).skill_level

defender = Player.new(Defense.new)
midfielder = Player.new(Pass.new)
forward = Player.new(Kick.new)
