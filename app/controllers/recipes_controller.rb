class RecipesController < ApplicationController
  def edit
    @course = Course.find(params[:course_id])
    @event = @course.event
    @recipes = @course.recipes.includes(:ingredient)
    @available_ingredients = Ingredient.where.not(id: @recipes.pluck(:ingredient_id))
  end
end
