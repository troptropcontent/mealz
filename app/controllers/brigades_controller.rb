class BrigadesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
  end

  def create
    brigade = Brigade.create(brigade_params)
    redirect_to event_brigades_path(brigade.event)
  end

  def destroy
    brigade = Brigade.find(params[:id])
    brigade.destroy
    redirect_to event_brigades_path(brigade.event)
  end

  private

  def brigade_params
    params.require(:brigade).permit(:name, :event_id, chefs_attributes: [:guest_id])
  end
end
