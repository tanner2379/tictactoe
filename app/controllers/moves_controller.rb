class MovesController < ApplicationController

  def create
    @game = Game.find(params[:game])

    @move = Move.new(move_params.except(:game))
    @move.game = @game

    if @game.moves.count % 2 == 0
      @move.player = 1
    else
      @move.player = 2
    end

    if @move.save

      moves = @game.moves
      winner = nil
      complete = false
  
      if moves.length == 9
        complete = true
      end
  
      player1moves = moves.where(player: 1)
      player2moves = moves.where(player: 2)
  
      # Player 1 win along column 1
      if player1moves.where(column: 1).select(:row).map(&:row).uniq.length == 3
        winner = 1
        complete = true
  
      # Player 1 win along column 2
      elsif player1moves.where(column: 2).select(:row).map(&:row).uniq.length == 3
        winner = 1
        complete = true
  
      # Player 1 win along column 3
      elsif player1moves.where(column: 3).select(:row).map(&:row).uniq.length == 3
        winner = 1
        complete = true
  
      # Player 1 win along row 1
      elsif player1moves.where(row: 1).select(:column).map(&:column).uniq.length == 3
        winner = 1
        complete = true
  
      # Player 1 win along row 2
      elsif player1moves.where(row: 2).select(:column).map(&:column).uniq.length == 3
        winner = 1
        complete = true
  
      # Player 1 win along row 3
      elsif player1moves.where(row: 3).select(:column).map(&:column).uniq.length == 3
        winner = 1
        complete = true
  
      # Player 1 win along LR Diagonal
      elsif player1moves.exists?(column: 1, row: 1) && player1moves.exists?(column: 2, row: 2) && player1moves.exists?(column: 3, row: 3)
        winner = 1
        complete = true
  
      # Player 1 win along RL Diagonal
      elsif player1moves.exists?(column: 3, row: 1) && player1moves.exists?(column: 2, row: 2) && player1moves.exists?(column: 1, row: 3)
        winner = 1
        complete = true
      end
  
  
      # Player 2 win along column 1
      if player2moves.where(column: 1).select(:row).map(&:row).uniq.length == 3
        winner = 2
        complete = true
  
      # Player 2 win along column 2
      elsif player2moves.where(column: 2).select(:row).map(&:row).uniq.length == 3
        winner = 2
        complete = true
  
      # Player 2 win along column 3
      elsif player2moves.where(column: 3).select(:row).map(&:row).uniq.length == 3
        winner = 2
        complete = true
  
      # Player 2 win along row 1
      elsif player2moves.where(row: 1).select(:column).map(&:column).uniq.length == 3
        winner = 2
        complete = true
  
      # Player 2 win along row 2
      elsif player2moves.where(row: 2).select(:column).map(&:column).uniq.length == 3
        winner = 2
        complete = true
  
      # Player 2 win along row 3
      elsif player2moves.where(row: 3).select(:column).map(&:column).uniq.length == 3
        winner = 2
        complete = true
  
      # Player 2 win along LR Diagonal
      elsif player2moves.exists?(column: 1, row: 1) && player2moves.exists?(column: 2, row: 2) && player2moves.exists?(column: 3, row: 3)
        winner = 2
        complete = true
  
      # Player 2 win along RL Diagonal
      elsif player2moves.exists?(column: 3, row: 1) && player2moves.exists?(column: 2, row: 2) && player2moves.exists?(column: 1, row: 3)
        winner = 2
        complete = true
      end
  
      if complete == true
        @game.update!(winner: winner, complete: complete)
      end
  
      redirect_to game_path(@game);
    else
      flash[:alert] = "Move cannot be completed: " + @move.errors.full_messages.first
      redirect_to game_path(@game);
    end
  end

  private

  def move_params
    params.permit(:game, :player, :column, :row)
  end

end
