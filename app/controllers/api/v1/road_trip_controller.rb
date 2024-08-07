class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
  
    if !params[:start_point].present?
      render json: { error: "Please enter a start point" }, status: 400
    elsif !params[:end_point].present?
      render json: { error: "Please enter a end point" }, status: 400
    else
      forecast = RoadTripFacade.new.find_road_trip(params[:start_point], params[:end_point])
      if user.nil?
        render json: {error: "Unauthorized"}, status: 401
      else
        forecast = RoadTripFacade.new.find_road_trip(params[:start_point], params[:end_point])
        render json: RoadTripSerializer.new(forecast)
      end
    end
  end
end