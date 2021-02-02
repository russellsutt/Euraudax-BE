class RoutesController < ApplicationController
    skip_before_action :authorized

    def index
        routes = Route.all
        render json: routes
    end

    def create
        route = Route.create(route_params)
        if route.save
            render json: route, status: :created
        else
          render json: { error: 'failed to create route' }, status: :not_acceptable
        end
    end

    def show
        route = Route.find(params[:id])
        render json: route
    end

    def update
        route = Route.find(params[:id])
        route.update!(route_params)

        if route.save
            render json: route  
        else
            render json: {error: route.errors.full_messages}, status: :not_acceptable
        end
    end

    private 
    
    def route_params
        params.require(:route).permit(:title, :description, :distance, :elevation, :estimated_time, :polyline, :user_id)
    end
end
