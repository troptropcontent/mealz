class Brigade < ApplicationRecord
  belongs_to :event
  has_many :chefs, dependent: :destroy
end
