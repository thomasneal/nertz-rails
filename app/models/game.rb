class Game < ApplicationRecord
  has_many :rounds
  #has_and_belongs_to_many :users
end
