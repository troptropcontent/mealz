class Ingredient < ApplicationRecord
  enum unit: %w[
    piéce
    gramme
    litre
    boite
  ]
  
end
