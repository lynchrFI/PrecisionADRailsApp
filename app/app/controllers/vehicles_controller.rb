class VehicleController < ApplicationController 

    before_action :set_vehicle, only [:show, :edit, :update, :destroy]
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
        else
            redner :edit
        end
    end

    def destroy
        @vehicle.destroy
        flash[:message] = "Vehicle successfully deleted!"
        redirect_to vehicle_path(@vehicle)
    end 

    private

    def vehicle_params
        params.require(:vehicle).permit(:year,
        :make,
        :model,
        :vehicle_category,
        )
    end

    def set_vehicle
        @vehicle = Vehicle.find_by(id: params[:id])
    end


end
