class Meal < ApplicationRecord
  belongs_to :event
  has_many :courses, dependent: :destroy
  enum kind: %w[petit-déjeuner déjeuner gouter apéro diner]
end
