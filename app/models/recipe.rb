class Recipe < ApplicationRecord
  belongs_to :course
  belongs_to :ingredient
end
