class RecipesController < ApplicationController
  def edit
    @course = Course.find(params[:course_id])
    @event = @course.event
    @recipes = @course.recipes.includes(:ingredient)
    @available_ingredients = Ingredient.where.not(id: @recipes.pluck(:ingredient_id))
  end

  def update
    @course = Course.find(params[:course_id])
    @event = @course.event
    @recipes = @course.recipes.includes(:ingredient)
    @available_ingredients = Ingredient.where.not(id: @recipes.pluck(:ingredient_id))

    @course.recipes.delete_all
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(recipes_attributes: %i[ingredient_id quantity])
  end
end
