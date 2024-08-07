class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: user_params["api_key"])
    #binding.pry
    if !params[:origin].present?
      render json: { error: "Please enter a start point" }, status: 400
    elsif !params[:destination].present?
      render json: { error: "Please enter a end point" }, status: 400
    else
      forecast = RoadTripFacade.new.find_road_trip(params[:origin], params[:destination])
      if user.nil?
        render json: {error: "Unauthorized"}, status: 401
      else
        forecast = RoadTripFacade.new.find_road_trip(params[:origin], params[:destination])
        render json: RoadTripSerializer.new(forecast)
      end
    end
  end

  private
  def user_params
    params.permit(:api_key)
  end
end