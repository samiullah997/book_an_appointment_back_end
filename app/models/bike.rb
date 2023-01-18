class Bike < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :bike_image, presence: true
  validates :description, presence: true
  validates :brand, presence: true
  validates :bike_type, presence: true
  validates :daily_rate, presence: true, numericality: { greater_than: 0 }
end
