require 'rails_helper'

RSpec.describe WeatherService do
  it "lists the next 5 days forecast over Cincinatti OH" do
    VCR.use_cassette('daily_forecast_OH'){
      forecast = WeatherService.new.daily_forecast(11.09977, -74.0817)
      expect(forecast).to be_a(Hash)
    }
  end
end