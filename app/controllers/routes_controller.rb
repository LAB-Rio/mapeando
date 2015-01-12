class RoutesController < ApplicationController
  def index
    @routes = Route.unique
  end

  def new
    @route  = Route.new({})
  end

  def create
    @route  = Route.new(route_params)
    if @route.save!
      flash[:notice] = 'Adicionado'
      render :new
    else 
      flash[:notice] = 'Ops'
      render :new
    end
  end


  def route_params
    params.require(:route).permit(:fullname, :lat, :long, :transport)
  end
end
