class Booking < ApplicationRecord
  STATUS = %w[pending confirmed rejected cancelled done]

  belongs_to :flat
  belongs_to :user

  has_one :review

  validates :status, inclusion: { in: STATUS }
  # validates :start_date, date: { after_or_equal_to: Date.today }
  validates :end_date, presence: true

  validate :end_date_after_start_date?, :start_date_after_today? #, :owner_booking?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  def start_date_after_today?
    if start_date <= Date.today
      errors.add :start_date, "must be after today"
    end
  end

end
