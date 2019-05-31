class Recap < ApplicationRecord
  serialize :moves, Array

  belongs_to :game
end
