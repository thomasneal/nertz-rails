class User < ApplicationRecord
  has_many :scores
  has_and_belongs_to_many :games

  def to_s
     name
   end
end
