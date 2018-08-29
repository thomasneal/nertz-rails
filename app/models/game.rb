class Game < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :rounds, dependent: :destroy
  has_many :scores, through: :rounds

  def isFinished
    scores = []
    
    self.users.each do |u|
      scores.push(self.scores.where(user: u).pluck(:value).sum)
    end

    if scores.max >= 100
      return true
    else
      return false
    end

  end

end
