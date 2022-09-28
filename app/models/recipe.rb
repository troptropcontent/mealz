class Recipe < ApplicationRecord
  belongs_to :course
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient
  validates :ingredient_id, uniqueness: { scope: :course_id }

  def unit
    ingredient&.unit
  end
end
