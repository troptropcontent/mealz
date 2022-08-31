class Event < ApplicationRecord
    has_many :guests, dependent: :destroy
    has_many :meals, dependent: :destroy
    has_many :courses, through: :meals
    has_many :recipes, through: :courses


    def days
        (start_on..end_on).to_a
    end
end


