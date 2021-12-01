class Flat < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :price_per_night, numericality: { greater_than: 0 }, presence: true
  validates :name, presence: true, length: { in: 1..100 }
  validates :location, presence: true
  validates :capacity, presence: true, inclusion: { in: 1..100 }
  validates :description, presence: true
  validates :photos, presence: true

<<<<<<< HEAD
  def average_rating
    return "No reviews" if reviews.length.zero?

    reviews.sum(:rating) / reviews.length.to_f
  end
=======
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
>>>>>>> master
end
