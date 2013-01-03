class ParticipantsController < ApplicationController
def create
  @event = Event.find(params[:event_id])
  @participant = @event.participants.create(params[:participant])

  respond_to do |format|
      if @participant.save
        format.html { redirect_to event_path(@event), notice: 'Participant was successfully created.' }
      else
        format.html { redirect_to event_path(@event), notice: 'Fill all the details for the participant.' }
      end
    end
end

def edit
  @event = Event.find(params[:event_id])
  @participant = @event.participants.find(params[:id])
end

def destroy
  @event = Event.find(params[:event_id])
  @participant = @event.participants.find(params[:id])
  @participant.destroy
  redirect_to event_path(@event)
end


end
