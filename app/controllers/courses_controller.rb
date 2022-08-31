class CoursesController < ApplicationController
  
  def new
    @course = Course.new(course_params)
    @meal = Meal.find(params[:meal_id])
  end

  def create
    @course = Course.new(course_params)
    RecipeParamsHandler.new(@course, recipe_params).call
    
    redirect_to meal_path(@course.meal)
  end

  def show
    load_course
    
  end

  def update
    load_course
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

  def load_course
    @course = Course.find(params[:id])
  end
end
