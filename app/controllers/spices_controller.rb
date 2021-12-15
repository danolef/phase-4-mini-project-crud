class SpicesController < ApplicationController

    before_action :find_spice, only: [:update, :destroy]

    def index
        spices= Spice.all 
        render json: spices
    end

    def create
        new_spice= Spice.create(spice_params)
        render json: new_spice, status: :created
    end

    def update
        @spice.update(spice_params)
        render json: @spice
    end

    def destroy
        @spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        @spice= Spice.find(params[:id])
    end

end
