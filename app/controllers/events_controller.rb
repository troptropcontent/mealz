class EventsController < ApplicationController

  def create
    @event = Event.new(event_params)
    if @event.save!
      create_meals!
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event= Event.new
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_on, :end_on)
  end

  def create_meals!
    MealsGenerator.new(@event).call
  end

end
