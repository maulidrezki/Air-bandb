class Flat < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :reviews, through: :bookings

  validates :price_per_night, numericality: { greater_than: 0 }, presence: true
  validates :name, presence: true, length: { in: 1..100 }
  validates :location, presence: true
  validates :capacity, presence: true, inclusion: { in: 1..100 }
  validates :description, presence: true
end
