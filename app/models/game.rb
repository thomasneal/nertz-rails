class Game < ApplicationRecord
  has_and_belongs_to_many :users


  #users = User.where("games_users.game_id = id")
end
