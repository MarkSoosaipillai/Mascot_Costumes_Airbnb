class Costume < ApplicationRecord
  categories = %w(corporate animal sports cartoon wedding)
  belongs_to :user
  has_many :reservations
  validates :name, :descr, :size, :category, :user_id, presence: true if :valid_category?
  validates :descr, length: {minimum: 20}
  validates :size, inclusion: {in: %w(small medium large),  message: "%{value} is not a valid size, choose small, medium or large"}
  validates :category, inclusion: {in: %w(Corporate Animal Sports Cartoon Wedding), case_sensitive: false, message: "%{value} is not a valid category."}
  validates :price, :numericality => { greater_than: 1, message: "You're wrong! Should be greater than 1"}


  private

  def valid_category?
    categories.include? :category.downcase
  end

end
