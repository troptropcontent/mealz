class CoursesController < ApplicationController
  load_and_authorize_resource
  def new
    @meal = Meal.find(params[:meal_id])
  end

  def create
    RecipeParamsHandler.new(@course, recipe_params).call
    
    redirect_to meal_path(@course.meal)
  end

  def show
    
  end

  def update
    RecipeParamsHandler.new(@course, recipe_params).call
    
    redirect_to meal_path(@course.meal)
  end

  def destroy
    @course.destroy
    redirect_to meal_path(@course.meal)
  end
 
  private

  def course_params
    params.require(:course).permit(
      :name, 
      :description, 
      :meal_id, 
      :kind, 
      )
  end

  def recipe_params
    params.require(:course).permit(recipes_attributes: [:quantity, ingredient: [:unit, :name]])[:recipes_attributes].values
  end
end
