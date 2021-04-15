class Move < ApplicationRecord
  belongs_to :game
  
  validates_presence_of :player, :column, :row
  validate :column_row_must_be_unique, :game_must_not_be_completed

  private

  def column_row_must_be_unique
    if Move.exists?(game: game, column: column, row: row)
      errors.add(:column, "and Row Combination must be unique!")
    end
  end

  def game_must_not_be_completed
    if Game.find(game_id).complete
      errors.add(:game_id, "Game cannot be complete")
    end
  end
end
