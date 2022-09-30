class IngredientsController < ApplicationController
  def new
    @course = Course.find(course_params[:id])
    @event = @course.event
    @ingredient = Ingredient.new
    @recipes_from_previous_page = Course.new(course_from_previous_page_params).recipes
  end

  def create
    @course = Course.find(course_params[:id])
    @event = @course.event
    @ingredient = Ingredient.new(ingredient_params)
    @recipes_from_previous_page = Course.new(course_from_previous_page_params).recipes
    if @ingredient.save
      redirect_to course_recipes_edit_path(
        @course,
        {
          course_from_previous_page: course_from_previous_page_params.to_h,
          preselected_ingredient_id: @ingredient.id
        }
      )
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:id, recipes_attributes: %i[ingredient_id quantity])
  end

  def course_from_previous_page_params
    params.require(:course).permit(recipes_attributes: %i[ingredient_id quantity])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit, :category)
  end
end
