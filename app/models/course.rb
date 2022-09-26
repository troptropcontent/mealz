class Course < ApplicationRecord
  belongs_to :meal
  has_one :event, through: :meal
  has_many :recipes, dependent: :destroy
  has_many :ingredients, through: :recipes
  accepts_nested_attributes_for :recipes, allow_destroy: true, reject_if: lambda { |attributes|
    attributes['quantity'].blank?
  }
  enum kind: %w[entrée plat dessert apéro]

  validates :name, presence: true
end
