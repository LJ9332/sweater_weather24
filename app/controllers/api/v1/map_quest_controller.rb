class Api::V1::MapQuestController < ApplicationController
  def location
    conn = Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.headers["MAP_QUEST_API_KEY"] = Rails.application.credentials.api_key[:map_quest]
    end
    # add loction as a required query param
    # response = conn.get("/geocoding/v1/address?location=cincinatti,oh")
    response = conn.get("/geocoding/v1/address") do |req|
      req.params['location'] = "cincinatti,oh"
    end
    binding.pry

    json = JSON.parse(response.body, symbolize_names: true)[:results]

    location = json[:providedLocation][:location]
    lat = json[:locations][:latLng][:lat]
    lng = json[:locations][:latLng][:lng]

    conn = Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.headers["WEATHER_API_KEY"] = Rails.application.credentials.api_key[:weather]
    end

    response = conn.get("/v1/forecast.json") do |req|
      req.params['latitude'] = lat
      req.params['longitude'] = lng
    end
  end
end