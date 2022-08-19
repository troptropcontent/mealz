class Event < ApplicationRecord
    has_many :guests, dependent: :destroy
    has_many :meals, dependent: :destroy
end


