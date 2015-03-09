class DemandsController < ApplicationController

  respond_to :json, :html


  before_filter only: [:create] do 
    @category = Category.find_by(id: demand_params[:category_id])
    @user     = User.find_by(id: demand_params[:user_id])
  end

  def index
    @demands = Demand.all
    respond_with @demands
  end

  def new
  end



  def create
    @demand = Demand.create(demand_params)
    @demand.user = @user
    @demand.category = @category

    if @demand.save
      render json: { demand: @demand }, status: :ok
    else
      render json: { demand: @demand.errors }, status: :unprocessable_entity
    end
  end


  def demand_params
    params.require(:demand).permit(:fullname, :category_id, :user_id, pins_attributes: [:fullname, :lat, :long])
  end


end
