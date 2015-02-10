class DemandsController < ApplicationController
  def index
  end

  def new
  end

  def create
#    @route  = Demand.new(route_params)
    #if @route.save!
      #flash[:notice] = 'Adicionado'
      #redirect_to routes_path
    #else 
      #flash[:notice] = 'Ops'
      #render :new
    #end
  end


  def route_params
    params.require(:demand).permit(:fullname, :lat, :long, :transport)
  end
end
