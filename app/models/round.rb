class Round < ApplicationRecord
  belongs_to :game
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :scores

  default_scope { order(created_at: :asc) }
end
