class Room < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  include PgSearch::Model
  pg_search_scope :search_by_title_and_address,
    against: [ :title, :description, :city ],
    using: {
      tsearch: { prefix: true }
    }

  has_many :reservations
  has_many :reviews, through: :reservations
  belongs_to :user

  validates :city, :neighborhood, :room_number, :bathroom_number, :bed_number, :max_ccupants, :price, :available_start_date, :available_end_date, :room_pictures, presence: true
end
