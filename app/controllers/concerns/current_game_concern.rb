module Concerns::CurrentGameConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_game
  end

  def set_current_game
    @current_game = Game.last
  end
end