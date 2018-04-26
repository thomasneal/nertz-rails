class Score < ApplicationRecord
  belongs_to :round
  belongs_to :user

  validates :value, presence: true, numericality: {only_integer: true}
end
