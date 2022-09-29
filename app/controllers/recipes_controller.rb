class RecipesController < ApplicationController
  def edit
    @course = Course.find(params[:course_id])
    @event = @course.event
    @recipes = recipes
    @preselected_ingredient_id = preselected_ingredient_id_params
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

  def recipes
    if course_from_previous_page_params.present?
      Course.new(course_from_previous_page_params).recipes
    else
      @course.recipes.includes(:ingredient)
    end
  end

  def course_params
    params.require(:course).permit(recipes_attributes: %i[ingredient_id quantity])
  end

  def course_from_previous_page_params
    params.permit(
      course_from_previous_page:
          [recipes_attributes:
              %i[ingredient_id quantity]]
    )[:course_from_previous_page]
  end

  def preselected_ingredient_id_params
    params.permit(:preselected_ingredient_id)[:preselected_ingredient_id]
  end
end
