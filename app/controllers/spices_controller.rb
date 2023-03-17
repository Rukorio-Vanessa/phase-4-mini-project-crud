class SpicesController < ApplicationController
    #GET: return array of all spices
    def index
        render json: Spice.all
    end
    
    #POST: creates a new spice
    def create
        render json: Spice.create(spice_params), status: :created
    end
    
    #PATCH: updates a spice
    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end
    
    #DELETE: deletes a spice
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private 
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

end
