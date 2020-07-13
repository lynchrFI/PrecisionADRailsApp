class VehicleController < ApplicationController 

    def index
        @vehicles = Vehicle.all
    end

    def new 
        @vehicle = Vehicle.new
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)
        if @vehicle.save
            redirect_to vehicle_path(@vehicle)
        else 
            render :new
        end
    end

    def show 

    end

    def edit

    end 

    def update
        if vehicle.update(vehicle_params)
            flash[:message] =  "Your vehicle has been updated!"
            redirect_to vehicle_path(@vehicle)
    end

end
