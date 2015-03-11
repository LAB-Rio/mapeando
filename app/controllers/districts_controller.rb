class DistrictsController < ApplicationController


  respond_to :json


  def index
    @districts = District.all
    render json: @districts, status: :ok
  end




end
