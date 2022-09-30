class Ingredient < ApplicationRecord
  has_many :recipes

  enum unit: %w[
    piéce
    gramme
    litre
    boite
  ]
  enum category: {
    'Autres': 0,
    'Fruits et légumes': 1,
    'Produits laitiers': 2,
    'Viande': 3,
    'Poisson': 4,
    'Alcool': 5,
    'Epicerie': 6
  }

  validates :name, uniqueness: true
  validates :unit, :name, :category, presence: true

  def self.new(args = {})
    args[:name] = args[:name].strip.downcase if args[:name]
    super
  end
end
