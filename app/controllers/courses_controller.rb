class CoursesController < ApplicationController
  def new
    @course = Course.new
    @meal = Meal.find(params[:meal_id])
    @event = @meal.event
  end

  def create
    @meal = Meal.find_by(meal_params)
    @course = @meal.courses.new(course_params)
    @event = @meal.event
    if @course.save
      redirect_to meal_path(@course.meal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @meal = Meal.find_by(meal_params)
    @event = @meal.event
    @course = Course.find(params[:id])
    
    if @course.update(meal: @meal, **course_params)
      redirect_to meal_path(@course.meal)
    else
      render :new, status: :unprocessable_entity
    end
  end  

  def show
    load_course
    @event = @course.event
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

  def load_course
    @course = Course.find(params[:id])
  end
end
