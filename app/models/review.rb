class Review < ApplicationRecord
  has_one :user, through: :reservations
  has_one :room, through: :reservations
  belongs_to :reservation

  validates :rating, :comment, presence: true
end
