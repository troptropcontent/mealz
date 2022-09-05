class Brigade < ApplicationRecord
  belongs_to :event
  has_many :chefs, dependent: :destroy
  has_many :guests, through: :chefs
  accepts_nested_attributes_for :chefs
  validates :name, presence: true
end
