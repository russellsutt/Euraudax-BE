class AttendeesController < ApplicationController
    skip_before_action :authorized

    def index
        attendees = Attendee.all
        render json: attendees
    end

    def show
        attendee = Attendee.find(params[:id])
        render json: attendee
    end

    def create
        attendee = Attendee.create!(attendee_params)
        if attendee.save!
          render json: attendee, status: :created
        else
          render json: { error: 'failed to create attendee' }, status: :not_acceptable
        end
    end

    def destroy
        attendee = Attendee.find(params[:id])
        attendee.destroy
        render json: {}
    end
    
    private 
    
    def attendee_params
        params.require(:attendee).permit(:user_id, :event_id)
    end
end
