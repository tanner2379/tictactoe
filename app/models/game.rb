class Game < ApplicationRecord
  has_many :moves, dependent: :delete_all
end
