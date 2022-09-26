class Recipe < ApplicationRecord
  belongs_to :course
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient

  def unit
    ingredient&.unit
  end
end
