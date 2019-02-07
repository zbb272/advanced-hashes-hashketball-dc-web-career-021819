require "pry"
def game_hash
  hash = {
    home: {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12,
          :steals => 3, :blocks => 1, :slam_dunks => 1 
        },
        "Reggie Evans" => {
          :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12,
          :steals => 12, :blocks => 12, :slam_dunks => 7 
        },
        "Brook Lopez" => {
          :number => 11, :shoe => 17, :points => 17,  :rebounds => 19, :assists => 10,
          :steals => 3, :blocks => 1, :slam_dunks => 15 
        },
        "Mason Plumlee" => {
          :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6,
          :steals => 3, :blocks => 8, :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2,
          :steals => 4, :blocks => 11, :slam_dunks => 1 
        }
      }
    }, 
    away: {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4, :shoe => 18, :points => 10,  :rebounds => 1, :assists => 1,
          :steals => 2, :blocks => 7, :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0, :shoe => 16,  :points => 12, :rebounds => 4, :assists => 7,
          :steals => 7, :blocks => 15, :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12,
          :steals => 4, :blocks => 5, :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2,
          :steals => 1, :blocks => 1, :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12,
          :steals => 22, :blocks => 5, :slam_dunks => 12
        }
      }
    }
  }
end 

def num_points_scored(player_name)
  points_scored = nil 
  game_hash.each do | key, data |
    data.each do | attribute, value |
      if attribute == :players
        value.each do | name, stats |
          if name == player_name
            points_scored = stats[:points]
          end 
        end 
      end 
    end 
  end 
  points_scored
end 

def shoe_size(player_name)
  shoe = nil 
  game_hash.each do | key, data |
    data.each do | attribute, value |
      if attribute == :players
        value.each do | name, stats |
          if name == player_name
            shoe = stats[:shoe]
          end 
        end 
      end 
    end 
  end 
  shoe
end 

def team_colors(team_name)
  colors = [] 
  game_hash.each do | team, data |
    if data[:team_name] == team_name
      colors = data[:colors]
    end 
  end 
  colors
end 

def team_names
  teams = []
  game_hash.each do | team, data |
    teams << data[:team_name]
  end 
  teams
end 

def player_numbers(team_name)
  numbers = []
  game_hash.each do | team, data |
    if data[:team_name] == team_name
      data.each do | attribute, value |
        if attribute == :players
          value.each do | name, stats |
            numbers << stats[:number]
          end 
        end 
      end 
    end
  end 
  numbers
end 

def player_stats(player_name)
  player_stat = nil 
  game_hash.each do | team, data |
    data.each do | attribute, value |
      if attribute == :players
        value.each do | name, stats |
          if name == player_name
            player_stat = stats
          end 
        end 
      end 
    end 
  end 
  player_stat
end 

def big_shoe_rebounds
  largest_shoe_size = nil 
  largest_shoe_rebounds = nil 
  game_hash.each do | team, data |
    data.each do | attribute, value |
      if attribute == :players
        value.each do | name, stats |
          if largest_shoe_size == nil
            largest_shoe_size = stats[:shoe]
            largest_shoe_rebounds = stats[:rebounds]
          elsif stats[:shoe] > largest_shoe_size
            largest_shoe_size = stats[:shoe]
            largest_shoe_rebounds = stats[:rebounds]
          end 
        end 
      end 
    end 
  end 
  largest_shoe_rebounds
end 

def most_points_scored
  most_points = nil 
  player_most_points = nil 
  game_hash.each do | team, data |
    data.each do | attribute, value |
      if attribute == :players
        value.each do | name, stats |
          if most_points == nil
            most_points = stats[:points]
            player_most_points = name 
          elsif stats[:points] > most_points
            most_points = stats[:points]
            player_most_points = name
          end 
        end 
      end 
    end 
  end 
  player_most_points
end 

def winning_team
  home_team_points = 0 
  away_team_points = 0 
  game_hash.each do | team, data |
    if team == :home
      data.each do | attribute, value |
        if attribute == :players
          value.each do | name, stats |
            home_team_points += stats[:points]
          end 
        end 
      end 
    else 
      data.each do | attribute, value |
        if attribute == :players
          value.each do | name, stats |
            away_team_points += stats[:points]
          end 
        end 
      end
    end 
  end 
  if home_team_points > away_team_points
    game_hash[:home][:team_name]
  else 
    game_hash[:away][:team_name]
  end 
end 

def player_with_longest_name
  most_letters = nil 
  player_most_letters = nil 
  game_hash.each do | team, data |
    data.each do | attribute, value |
      if attribute == :players
        value.each do | name, stats |
          if most_letters == nil
            most_letters = name.length
            player_most_letters = name 
          elsif name.length > most_letters
            most_letters = name.length
            player_most_letters = name
          end 
        end 
      end 
    end 
  end 
  player_most_letters
end 

def long_name_steals_a_ton?
  most_steals = nil 
  player_most_steals = nil 
  game_hash.each do | team, data |
    data.each do | attribute, value |
      if attribute == :players
        value.each do | name, stats |
          if most_steals == nil
            most_steals = stats[:steals]
            player_most_steals = name 
          elsif stats[:steals] > most_steals
            most_steals = stats[:steals]
            player_most_steals = name
          end 
        end 
      end 
    end 
  end 
  if player_most_steals == player_with_longest_name
    true 
  else 
    false 
  end 
end 

