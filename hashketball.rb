# Write your code here!
  def game_hash
{
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      players: {
        "Alan Anderson" => 
          {number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          steals: 3,
          assists: 12,
          blocks: 1,
          slam_dunks: 1},
          
          "Reggie Evans" => 
          {number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          steals: 12,
          assists: 12,
          blocks: 12,
          slam_dunks: 7},
          
          "Brook Lopez" => 
          {number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          steals: 3,
          assists: 10,
          blocks: 1,
          slam_dunks: 15},
          
          "Mason Plumlee" => 
          {number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          steals: 3,
          assists: 6,
          blocks: 8,
          slam_dunks: 5},
          
          "Jason Terry" => 
          {number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          steals: 4,
          assists: 2,
          blocks: 11,
          slam_dunks: 1},
      }
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => 
          {number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          steals: 2,
          assists: 1,
          blocks: 7,
          slam_dunks: 2},
          
          "Bismak Biyombo" =>
          {number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          steals: 7,
          assists: 7,
          blocks: 15,
          slam_dunks: 10},
          
          "DeSagna Diop" => 
          {number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          steals: 4,
          assists: 12,
          blocks: 5,
          slam_dunks: 5},
          
          "Ben Gordon" => 
          {number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          steals: 1,
          assists: 2,
          blocks: 1,
          slam_dunks: 0},
          
          "Brendan Haywood" => 
          {number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          steals: 22,
          assists: 12,
          blocks: 5,
          slam_dunks: 12},
      }
    }
  }
  end

def team_names
  hash = game_hash
  arr = []
  hash.each do |k, v|
    arr.push(hash[k][:team_name])
  end
  arr
end

def team_colors (team_name)
  colors = []
  hash = game_hash
  hash.values.flatten.each do |team|
    if (team[:team_name] == team_name)
      colors.push (team[:colors])
    end
  end
  colors.flatten
end

# helper method that returns a one-dimensional array of the player hashes
def get_players 
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def player_stats (player_name)
  players = get_players
  players.fetch(player_name)
end

def num_points_scored (player_name)
  player = player_stats(player_name)
  player[:points]
end

def shoe_size (player_name)
  player = player_stats(player_name)
  player[:shoe]
end

def get_team (team_name)
  game_hash.values.find{|team| team.fetch(:team_name) == team_name}
end

def player_numbers (team_name)
  # player = player_stats(player_name)
  get_team(team_name)[:players].collect{|players_name, stats| stats[:number]}
end

def big_shoe_rebounds 
  players = get_players
  big_shoe_guy = players.max_by{|player, stats| stats.fetch(:shoe)}[1]
  big_shoe_guy[:rebounds]
end



