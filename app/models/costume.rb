class Costume < ApplicationRecord
  categories = %w(Corporate Animal Sports Cartoon Wedding)
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :name, :descr, :size, :category, :user_id, presence: true if :valid_category?
  validates :descr, length: {minimum: 1}
  validates :size, inclusion: {in: %w(Small Medium Large),  message: "%{value} is not a valid size, choose small, medium or large"}
  validates :category, inclusion: {in: %w(Corporate Animal Sports Cartoon Wedding), case_sensitive: false, message: "%{value} is not a valid category."}
  validates :price, :numericality => { greater_than: 1, message: "You're wrong! Should be greater than 1"}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def valid_category?
    categories.include? :category.downcase
  end
end
