class Costume < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, :descr, :price, :size, :category, :user_id, presence: true
  validates :descr, length: {minimum: 20}
  validates :size, inclusion: {in: %w(small medium large), message: "%{value} is not a valid size, choose small, medium or large"}
  validates
end
