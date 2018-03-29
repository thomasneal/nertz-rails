class Score < ApplicationRecord
  #belongs_to :round
  belongs_to :user

  validates :value, :user, presence: true
end
