class Round < ApplicationRecord
  belongs_to :game
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :scores

  validates :nertz_user_id, presence: true

  default_scope { order(created_at: :asc) }
end
