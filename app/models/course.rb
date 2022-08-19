class Course < ApplicationRecord
  belongs_to :meal
  enum kind: %w[entrée plat dessert apéro]
end
