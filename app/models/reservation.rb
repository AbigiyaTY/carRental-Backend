class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return unless start_date.present? && end_date.present? && end_date < start_date

    errors.add(:end_date, 'must be after start date')
  end
end
