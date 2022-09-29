class Ingredient < ApplicationRecord
  has_many :recipes

  enum unit: %w[
    piéce
    gramme
    litre
    boite
  ]

  validates :name, uniqueness: true
  validates :unit, :name, presence: true

  def self.new(args = {})
    args[:name] = args[:name].strip.downcase if args[:name]
    super
  end
end
