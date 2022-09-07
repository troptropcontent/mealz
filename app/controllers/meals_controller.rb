class MealsController < ApplicationController
  def destroy
    load_meal
    @meal.destroy
    redirect_to event_path(@meal.event)
  end

  def show
    load_meal
    @event = @meal.event
  end

  def update
    load_meal
    @event = @meal.event
    @meal.update(meal_params)
    redirect_to meal_path(@meal)
  end

  def new
    @event = Event.find(params[:event_id])
    new_meal
  end

  def create
    build_meal
    @meal.save!
    redirect_to event_path(@meal.event)
  end

  private

  def meal_params
    params.require(:meal).permit(:event_id, :scheduled_on, :kind, :brigade_id)
  end

  def load_meal
    @meal = Meal.find(params[:id])
  end

  def build_meal
    @meal = Meal.new(meal_params)
  end

  def new_meal
    @meal = Meal.new
  end
end
