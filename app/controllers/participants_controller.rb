class ParticipantsController < ApplicationController
def create
  @event = Event.find(params[:event_id])
  @participant = @event.participants.create(params[:participant])
  redirect_to event_path(@event)
end

def edit
  @participant = @event.participants.find(params[:id])
end

def destroy
  @event = Event.find(params[:event_id])
  @participant = @event.participants.find(params[:id])
  @participant.destroy
  redirect_to event_path(@event)
end



end
