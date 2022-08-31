class EventsController < ApplicationController

  def create
    build_event
    @event.save!
    create_meals!
    redirect_to event_path(@event)
  end

  def destroy
    load_event
    @event.update(deleted: true)
    redirect_to event_path(@event)
  end

  def show
    load_event
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

  def load_event
    @event = Event.find(params[:id])
  end

  def build_event
    @event = Event.new(event_params)
  end
end
