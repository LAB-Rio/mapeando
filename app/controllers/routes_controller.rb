class RoutesController < ApplicationController
  def index
    @routes = Route.unique
    @route = Route.new({})
  end

  def new
  end

  def create
    @route  = Route.new(route_params)
    if @route.save!
      flash[:notice] = 'Adicionado'
      redirect_to routes_path
    else 
      flash[:notice] = 'Ops'
      render :new
    end
  end


  def route_params
    params.require(:route).permit(:fullname, :lat, :long, :transport)
  end
end
