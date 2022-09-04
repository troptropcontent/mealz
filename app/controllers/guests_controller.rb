class GuestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
  end

  def create
    guest = Guest.create(guest_params)
    redirect_to event_guests_path(guest.event)
  end

  private

  def guest_params
    params.require(:guest).permit(:nickname, :event_id)
  end
end
