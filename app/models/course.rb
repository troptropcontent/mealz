class Course < ApplicationRecord
  belongs_to :meal
  has_one :event, through: :meal
  has_many :recipes, dependent: :destroy
  has_many :ingredients, through: :recipes
  accepts_nested_attributes_for :recipes
  accepts_nested_attributes_for :ingredients
  enum kind: %w[entrée plat dessert apéro]
end
