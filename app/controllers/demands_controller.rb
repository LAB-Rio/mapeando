class DemandsController < ApplicationController

  respond_to :json, :html
  has_scope :by_category_id


  before_filter only: [:create] do 
    @category = Category.find_by(id: demand_params[:category_id])
    @user     = User.find_by(id: demand_params[:user_id])
  end

  def index
    @demands = apply_scopes(Demand.all).all
    render json: @demands
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




  def show
    @demand = Demand.find_by(id: params[:id])
    render json: @demand
  end





  def demand_params
    params.require(:demand).permit(:fullname, :category_id, :user_id, pins_attributes: [:fullname, :lat, :long])
  end


end
