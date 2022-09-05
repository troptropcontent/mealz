class CoursesController < ApplicationController
  def new
    @course = Course.new
    @meal = Meal.find(params[:meal_id])
    @event = @meal.event
  end

  def create
    @meal = Meal.find_by(meal_params)
    @course = Course.new(meal: @meal, **course_params)
    RecipeParamsHandler.new(@course, recipe_params).call

    redirect_to meal_path(@course.meal)
  end

  def show
    load_course
  end

  def update
    @meal = Meal.find_by(meal_params)
    @course = Course.find(params[:id])
    @course.update(meal: @meal, **course_params)
    RecipeParamsHandler.new(@course, recipe_params).call

    redirect_to meal_path(@course.meal)
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to meal_path(course.meal)
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :description,
      :kind
    )
  end

  def meal_params
    params.require(:course).permit(meal: {})[:meal]
  end

  def recipe_params
    params.require(:course).permit(recipes_attributes: [:quantity, {
                                     ingredient: %i[unit name]
                                   }])[:recipes_attributes].values
  end

  def load_course
    @course = Course.find(params[:id])
  end
end
