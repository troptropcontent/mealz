class MealsController < ApplicationController
    load_and_authorize_resource
    def destroy
        @meal.destroy
        redirect_to event_path(@meal.event)
    end

    def new 
        @event = Event.find(params[:event_id])
    end

    def create
        @meal.save!
        redirect_to event_path(@meal.event)
    end

    private

    def meal_params
        params.require(:meal).permit(:event_id, :scheduled_on, :kind)
    end
end
