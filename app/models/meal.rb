class Meal < ApplicationRecord
  belongs_to :event
  has_many :courses, dependent: :destroy
  enum kind: %w[petit-déjeuner déjeuner diner apéro]
end
