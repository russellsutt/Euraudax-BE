class EventsController < ApplicationController
    skip_before_action :authorized

    def index
        events = Event.all
        render json: events
    end

    def create
        event = Event.create(event_params)
        if event.save
            render json: event, status: :created
        else
          render json: { error: 'failed to create event' }, status: :not_acceptable
        end
    end

    def show
        event = Event.find(params[:id])
        render json: event
    end

    def update
        event = Event.find(params[:id])
        event.update!(event_params)

        if event.save
            render json: event  
        else
            render json: {error: event.errors.full_messages}, status: :not_acceptable
        end
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy
        render json {}
    end

    private 
    
    def event_params
        params.require(:event).permit(:title, :date, :time, :pace, :archived, :user_id, :route_id)
    end
end
