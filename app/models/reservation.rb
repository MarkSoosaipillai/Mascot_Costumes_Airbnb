class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  validates :status, inclusion: { in: %w(Pending Approved Rejected), default: "Pending" }
  validates :start_date, :end_date, presence: true #:type => date
  validates :user_id, :costume_id, :status, :start_date, :end_date, presence: true
end
