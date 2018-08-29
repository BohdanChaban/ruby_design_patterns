# Observer
class Team
  attr_reader :name

  def initialize
    @name = 'Karpaty Lviv'
    @managers = []
  end

  def add_player(player)
    @player = player
    puts "Player #{@player} is added to team"
    notify_managers
  end

  def add_manager(manager)
    @managers << manager
  end

  def delete_manager(manager)
    @managers.delete(manager)
  end

  def notify_managers
    @managers.each { |manager| manager.team_update(self) }
  end
end

# Subscriber

class Coach
  def initialize(name)
    @name = name
  end

  def team_update(team)
    puts "#{@name} update: Team #{team.name} is updated"
  end
end

team = Team.new

team.add_manager(Coach.new('Jose Mourinho'))
team.add_manager(Coach.new('Sir Alex Ferguson'))

team.add_player('Marjan Shved')

# Player Marjan Shved is added to team
# Jose Mourinho update: Team Karpaty Lviv is updated
# Sir Alex Ferguson update: Team Karpaty Lviv is updated
