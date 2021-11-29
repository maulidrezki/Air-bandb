class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true, length: { in: 2..500 }
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
