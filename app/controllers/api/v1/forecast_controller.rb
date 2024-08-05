class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.new.find_forecast(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end