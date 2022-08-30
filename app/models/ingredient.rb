class Ingredient < ApplicationRecord
  enum unit: %w[
    piéce
    gramme
    litre
    boite
  ]

  validates :name, uniqueness: true  
end
