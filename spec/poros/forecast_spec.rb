require 'rails_helper'

RSpec.describe Forecast do
  it "exists" do
    VCR.use_cassette('forecast_poro_OH'){
      current_weather = { 
        :last_updated => "2024-08-05 17:15",
        :temperature => 0.0,
        :feels_like => 0.0,
        :humidity => 79,
        :uvi => 0,
        :visibility => 0,
        :text => "Sunny",
        :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
      }

      # 5 days
      daily_weather = [
        {:date => "2024-08-05",
          :sunrise => "05:46 AM",
          :sunset => "06:20 PM",
          :max_temp => 86.8,
          :min_temp => 76.6,
          :condition => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {:date => "2024-08-06",
          :sunrise => "05:46 AM",
          :sunset => "06:19 PM",
          :max_temp => 84.6,
          :min_temp => 76.7,
          :condition => {
            :text => "Moderate rain", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/302.png"
          }
        },
        {:date => "2024-08-07",
          :sunrise => "05:46 AM",
          :sunset => "06:19 PM",
          :max_temp => 81.1,
          :min_temp => 74.7,
          :condition => {
            :text => "Moderate rain", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/302.png"
          }
        },
        {:date => "2024-08-08",
          :sunrise => "05:46 AM",
          :sunset => "06:19 PM",
          :max_temp => 84.4,
          :min_temp => 74.6,
          :condition => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {:date => "2024-08-09",
          :sunrise => "05:46 AM",
          :sunset => "06:18 PM",
          :max_temp => 84.6,
          :min_temp => 76.0,
          :condition => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        } 
      ]

      # 24 hours
      hourly_weather = [
        {
          :time => "00:00", 
          :temperature => 77.6, 
          :conditions => {
            :text => "Clear ", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        },
        {
          :time => "01:00", 
          :temperature => 77.4, 
          :conditions => {
            :text => "Clear ", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        },
        {
          :time => "02:00", 
          :temperature => 77.4, 
          :conditions => {
            :text => "Clear ", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        },
        {
          :time => "03:00", 
          :temperature => 77.4, 
          :conditions => {
            :text => "Clear ", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        },
        {
          :time => "04:00", 
          :temperature => 77.1, 
          :conditions => {
            :text => "Clear ", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        },
        {
          :time => "05:00", 
          :temperature => 76.7, 
          :conditions => {
            :text => "Clear ", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        },
        {
          :time => "06:00", 
          :temperature => 76.6, 
          :conditions => {
            :text => "Sunny", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        },
        {
          :time => "07:00", 
          :temperature => 80.0, 
          :conditions => {
            :text => "Sunny", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        },
        {
          :time => "08:00", 
          :temperature => 82.5, 
          :conditions => {
            :text => "Sunny",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        },
        {
          :time => "09:00", 
          :temperature => 84.3, 
          :conditions => {
            :text => "Sunny", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        },
        {
          :time => "10:00", 
          :temperature => 85.2, 
          :conditions => {
            :text => "Sunny", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        },
        {
          :time => "11:00", 
          :temperature => 86.3, 
          :conditions => {
            :text => "Sunny",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        },
        {
          :time => "12:00", 
          :temperature => 86.6, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {
          :time => "13:00", 
          :temperature => 86.8, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {
          :time => "14:00", 
          :temperature => 86.5, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {
          :time => "15:00", 
          :temperature => 84.5, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {
          :time => "16:00", 
          :temperature => 83.1, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {
          :time => "17:00", 
          :temperature => 82.0, 
          :conditions => {
            :text => "Sunny", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        },
        {
          :time => "18:00", 
          :temperature => 80.4, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/day/176.png"
          }
        },
        {
          :time => "19:00", 
          :temperature => 79.1, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/176.png"
          }
        },
        {
          :time => "20:00", 
          :temperature => 78.5, 
          :conditions => {
            :text => "Clear ", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        },
        {
          :time => "21:00", 
          :temperature => 78.4, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/176.png"
          }
        },
        {
          :time => "22:00", 
          :temperature => 78.3, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/176.png"
          }
        },
        {
          :time => "23:00", 
          :temperature => 78.8, 
          :conditions => {
            :text => "Patchy rain nearby", 
            :icon => "//cdn.weatherapi.com/weather/64x64/night/176.png"
          }
        }
      ]

      forecast = Forecast.new(current_weather, daily_weather, hourly_weather)
    
      expect(forecast).to be_a(Forecast)
      expect(forecast.id).to eq('null')
      expect(forecast.type).to eq('forecast')
      expect(forecast.current_weather).to eq(current_weather)
      expect(forecast.daily_weather).to eq(daily_weather)
      expect(forecast.hourly_weather).to eq(hourly_weather)
    }
  end
end