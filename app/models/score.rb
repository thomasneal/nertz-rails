class Score < ApplicationRecord
  belongs_to :round
  belongs_to :user

  validates :value, :user, :round, presence: true
end
