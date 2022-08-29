class Recipe < ApplicationRecord
  belongs_to :course
  belongs_to :ingredient

  def unit 
    ingredient&.unit
  end
end
