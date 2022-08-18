class EventsController < ApplicationController
  load_and_authorize_resource
  def index
  end

  def create
    @event.save!
    @event.guests.create!(nickname: current_user.username, user: current_user)
    redirect_to events_path
  end

  def new
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_on, :end_on)
  end
end
