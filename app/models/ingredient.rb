class Ingredient < ApplicationRecord
  has_many :recipes
  
  enum unit: %w[
    piéce
    gramme
    litre
    boite
  ]

  validates :name, uniqueness: true  
end
