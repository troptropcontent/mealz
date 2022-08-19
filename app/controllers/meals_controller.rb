class MealsController < ApplicationController
    load_and_authorize_resource
    def destroy
        @meal.destroy
        redirect_to event_path(@meal.event)
    end
end
