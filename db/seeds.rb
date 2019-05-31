# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Game.destroy_all

@magnus = User.create(username: 'Magnus Carlson', password: 'winningisinevitable')
@bobby = User.create(username: 'Bobby Fischer', password: 'notificanhelpit')

@game_one = Game.create(stats: {Winner: 1, Loser: 2})

GameUser.create(game_id: @game_one.id, user_id: @magnus.id)
GameUser.create(game_id: @game_one.id, user_id: @bobby.id)
