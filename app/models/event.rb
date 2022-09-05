class Event < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :brigades, dependent: :destroy
  has_many :chefs, through: :brigades
  has_many :courses, through: :meals
  has_many :recipes, through: :courses

  validates :name, :start_on, :end_on, presence: true

  def days
    (start_on..end_on).to_a
  end
end
