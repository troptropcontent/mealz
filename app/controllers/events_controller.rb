class EventsController < ApplicationController
  load_and_authorize_resource
  def index
  end

  def create
    @event.save!
    @event.guests.create!(nickname: current_user.username, user: current_user)
    create_meals!
    redirect_to events_path
  end

  def destroy
    @event.update(deleted: true)
    redirect_to events_path
  end

  def new
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_on, :end_on)
  end

  def create_meals!
    MealsGenerator.new(@event).call
  end
end
