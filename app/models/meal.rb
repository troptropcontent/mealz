class Meal < ApplicationRecord
  belongs_to :event
  enum kind: %w[petit-déjeuner déjeuner diner apéro]
end
