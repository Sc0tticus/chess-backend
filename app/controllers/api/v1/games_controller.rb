class Api::V1::GamesController < ApplicationController

  before_action :find_game, only: [:show, :update, :destroy]
  before_action :get_all_games, only: [:index, :create, :destroy]

  def index
    render json: @games
  end

  def show
    render json: @game
  end

  def create
    @game = Game.new(stats: {
      Winner: game_params['Winner'],
      Loser: game_params['Loser'],
      })
    if @game.save
      GameUser.create(game_id: @game.id, user_id: game_params)
      GameUser.create(game_id: @game.id, user_id: game_params)
    else
      render status: 417
    end
  end

  def destroy
    @game.destroy 
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def get_all_games
    @games = Game.all
  end

  def game_params
    params.require(:stats).permit(:Winner, :Loser)
  end

end
