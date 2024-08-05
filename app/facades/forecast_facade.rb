class ForecastFacade
  def find_forecast(location)
    location_data = MapQuestService.new.find_location(location)
    lat = location_data[:results][0][:locations][0][:latLng][:lat]
    lng = location_data[:results][0][:locations][0][:latLng][:lng]
    weather_data = WeatherService.new.daily_forecast(lat, lng) 

    current_weather = {
      last_updated: weather_data[:current][:last_updated],
      temperature: weather_data[:current][:temperature].to_f,
      feels_like: weather_data[:current][:feels_like].to_f,
      humidity: weather_data[:current][:humidity].to_i,
      uvi: weather_data[:current][:uvi].to_i,
      visibility: weather_data[:current][:visibility].to_i,
      text: weather_data[:current][:condition][:text],
      icon: weather_data[:current][:condition][:icon]
    }

    daily_weather = weather_data[:forecast][:forecastday].map do |day|
      {
        date: day[:date],
        sunrise: day[:astro][:sunrise],
        sunset: day[:astro][:sunset],
        max_temp: day[:day][:maxtemp_f],
        min_temp: day[:day][:mintemp_f],
        condition: {
          text: day[:day][:condition][:text],
          icon: day[:day][:condition][:icon]
        }
      }
    end

    hourly_weather = weather_data[:forecast][:forecastday][0][:hour].map do |hour|
      {
        time: DateTime.parse(hour[:time]).strftime("%H:%M"),
        temperature: hour[:temp_f],
        conditions: {
          text: hour[:condition][:text],
          icon: hour[:condition][:icon]
        }
      }
    end

    Forecast.new(current_weather, daily_weather, hourly_weather)
  end
end