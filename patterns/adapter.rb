# existing interface
class Player
  def train_skill
    puts 'Player is training'
  end
end

# new `target` interface
class Training
  def initialize(trainer)
    @trainer = trainer
  end

  def train_player
    @trainer.train_player
  end
end

# adapter
class AttackTrainer
  def initialize(player)
    @player = player
  end

  # wraps old player #train_skill method
  # behind a new interface method
  def train_player
    @player.train_skill
  end
end

player = Player.new
trainer = AttackTrainer.new(player)
training = Training.new(trainer)

training.train_player
