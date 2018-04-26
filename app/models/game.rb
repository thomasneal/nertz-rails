class Game < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :rounds, dependent: :destroy
  has_many :scores, through: :rounds

end
