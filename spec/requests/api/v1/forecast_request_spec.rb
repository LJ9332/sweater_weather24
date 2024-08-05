require 'rails_helper'

describe "Forecast API" do
  it "sends daily, hourly, and current weather" do 
    VCR.use_cassette('forecast_api_OH') {
      get '/api/v1/forecast?location=cincinatti,oh'

      expect(response).to be_successful
      
      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful

      expect(forecast).to have_key(:id)
      expect(forecast[:id]).to eq("null")
      expect(forecast).to have_key(:type)
      expect(forecast[:type]).to eq("forecast")
      # current_weather data
      expect(forecast[:attributes][:current_weather]).to have_key(:last_updated)
      expect(forecast[:attributes][:current_weather][:last_updated]).to be_a(String)
      expect(forecast[:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(forecast[:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:attributes][:current_weather][:uvi]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast[:attributes][:current_weather][:visibility]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather]).to have_key(:text)
      expect(forecast[:attributes][:current_weather][:text]).to be_a(String)
      expect(forecast[:attributes][:current_weather]).to have_key(:icon)
      expect(forecast[:attributes][:current_weather][:icon]).to be_a(String)
      # daily_weather data
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:date)
      expect(forecast[:attributes][:daily_weather][0][:date]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunrise)
      expect(forecast[:attributes][:daily_weather][0][:sunrise]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunset)
      expect(forecast[:attributes][:daily_weather][0][:sunset]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:max_temp)
      expect(forecast[:attributes][:daily_weather][0][:max_temp]).to be_a(Float)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:min_temp)
      expect(forecast[:attributes][:daily_weather][0][:min_temp]).to be_a(Float)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:condition)
      expect(forecast[:attributes][:daily_weather][0][:condition]).to be_a(Hash)
      expect(forecast[:attributes][:daily_weather][0][:condition]).to have_key(:text)
      expect(forecast[:attributes][:daily_weather][0][:condition][:text]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0][:condition]).to have_key(:icon)
      expect(forecast[:attributes][:daily_weather][0][:condition][:icon]).to be_a(String)
      # hourly_weather data
      #binding.pry
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:time)
      expect(forecast[:attributes][:hourly_weather][0][:time]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:temperature)
      expect(forecast[:attributes][:hourly_weather][0][:temperature]).to be_a(Float)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:conditions)
      expect(forecast[:attributes][:hourly_weather][0][:conditions]).to be_a(Hash)
      expect(forecast[:attributes][:hourly_weather][0][:conditions]).to have_key(:text)
      expect(forecast[:attributes][:hourly_weather][0][:conditions][:text]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][0][:conditions]).to have_key(:icon)
      expect(forecast[:attributes][:hourly_weather][0][:conditions][:icon]).to be_a(String)
    }
  end
end