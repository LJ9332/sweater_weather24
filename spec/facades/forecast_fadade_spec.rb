require 'rails_helper'

RSpec.describe ForecastFacade do
  it "can get a 5 day forecast object" do
    VCR.use_cassette('forecast_cincinatti_OH') {
      location = "cincinatti,oh"
    
      forecast = ForecastFacade.new.find_forecast(location)
    
      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather).to have_key(:last_updated)
      expect(forecast.current_weather).to have_key(:temperature)
      expect(forecast.current_weather).to have_key(:feels_like)
      expect(forecast.current_weather).to have_key(:humidity)
      expect(forecast.current_weather).to have_key(:uvi)
      expect(forecast.current_weather).to have_key(:visibility)
      expect(forecast.current_weather).to have_key(:text)
      expect(forecast.current_weather).to have_key(:icon)
  
      expect(forecast.daily_weather[0]).to have_key(:date)
      expect(forecast.daily_weather[0]).to have_key(:sunrise)
      expect(forecast.daily_weather[0]).to have_key(:sunset)
      expect(forecast.daily_weather[0]).to have_key(:max_temp)
      expect(forecast.daily_weather[0]).to have_key(:min_temp)
      expect(forecast.daily_weather[0]).to have_key(:condition)
      expect(forecast.daily_weather[0][:condition]).to have_key(:text)
      expect(forecast.daily_weather[0][:condition]).to have_key(:icon)
  
      expect(forecast.hourly_weather[0]).to have_key(:time)
      expect(forecast.hourly_weather[0]).to have_key(:temperature)
      expect(forecast.hourly_weather[0]).to have_key(:conditions)
      expect(forecast.hourly_weather[0][:conditions]).to have_key(:text)
      expect(forecast.hourly_weather[0][:conditions]).to have_key(:icon)
    }
  end
end