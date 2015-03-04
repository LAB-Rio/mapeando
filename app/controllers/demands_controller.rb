class DemandsController < ApplicationController

  respond_to :json, :html

  def index
    @demands = Demand.all
    respond_with @demands
  end

  def new
  end

  def create

  end


  def route_params
    params.require(:demand).permit(:fullname, :lat, :long, :transport)
  end


end
