class Api::V1::ForecastController < ApplicationController
  def index
    conn = Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      # faraday.headers["MAP_QUEST_API_KEY"] = Rails.application.credentials.api_key[:map_quest]
    end
    # add loction as a required query param
    # response = conn.get("/geocoding/v1/address?location=cincinatti,oh")
    response = conn.get("/geocoding/v1/address") do |req|
      req.params['key'] = Rails.application.credentials.api_key[:map_quest]
      req.params['location'] = "cincinatti,oh"
    end
    
    json = JSON.parse(response.body, symbolize_names: true)[:results]
    
    #binding.pry
    lat = json[:locations][0][:latLng][:lat]
    lng = json[:locations][0][:latLng][:lng]

    conn = Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.headers["WEATHER_API_KEY"] = Rails.application.credentials.api_key[:weather]
    end

    response = conn.get("/v1/forecast.json") do |req|
      req.params['q'] = "#{lat},#{lng}"
      req.params['days'] = 5
    end
  end
end