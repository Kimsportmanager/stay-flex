class Room < ApplicationRecord
  geocoded_by :address

  # TODO: make an alias for user => should be "owner"
  # belongs_to :owner, class_name: "User"
  include PgSearch
  pg_search_scope :search_by_title_and_address,
    against: [ :title, :description, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  belongs_to :user
  has_many :bookings
  has_many :reviews

  after_validation :geocode, if: :will_save_change_to_address?

  validates :city, :neighborhood, :room_number, :bathroom_number, :bed_number, :max_ccupants, :price, :available_start_date, :available_end_date, :room_pictures, presence: true
end
