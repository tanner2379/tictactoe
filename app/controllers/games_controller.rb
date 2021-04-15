class GamesController < ApplicationController
  before_action :set_game, only: [:show, :destroy]

  def index
    @games = Game.all.order("created_at DESC")
  end

  def show
    @moves = @game.moves.map {|move| move.player.to_s + move.column.to_s + move.row.to_s}
  end

  def create
    @game = Game.create!

    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    redirect_to games_path

  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:winner)
  end

end
