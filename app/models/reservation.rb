class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  validates :status, inclusion: {in: %w(pending approved rejected), default:"pending"}
  validates :start_date, :end_date, :type => date
  validates :start_date, :end_date # =>  after: => Time.now
  validates :end_date => {after: :start_date}
  validates :user_id, :costume_id, :status, :start_date, :end_date, presence:true
  validates :message, :type => text
  # validates :dates_cannot_be_in_the_past

  # private

  # def dates_cannot_be_in_the_past
  #   errors.add(:start_date, "can't be in the past") if start_date < Date.today

  # end

end
