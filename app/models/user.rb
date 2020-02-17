class User < ApplicationRecord
    has_many :game_users, dependent: :destroy
    has_many :games, through: :game_users, dependent: :destroy

end
