class Room < ApplicationRecord
  has_many :reservations
  has_many :reviews, through: :reservations
  belongs_to :user

  validates :city, :neighborhood, :room_number, :bathroom_number, :bed_number, :max_ccupants, :price, :available_start_date, :available_end_date, :room_pictures, presence: true
end
