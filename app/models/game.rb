class Game < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :rounds, dependent: :destroy
  has_many :scores, through: :rounds

  def last_round
    rounds.last
  end

  def ordered_users
    users_list = []
    the_scores = last_round.scores.order_highest
    the_scores.each do |s|
      users_list.push(s.user)
    end
    return users_list
  end

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
