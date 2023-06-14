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

  belongs_to :user, foreign_key: 'users_id'
  has_many :bookings
  has_many :reviews

  after_validation :geocode, if: :will_save_change_to_address?



  def to_param
    id.to_s
  end
end
