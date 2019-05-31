class Game < ApplicationRecord
  serialize :stats, Hash

  has_many :game_users
  has_many :users, through: :game_users
  has_one :recap

end
