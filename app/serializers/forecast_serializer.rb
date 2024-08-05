class ForecastSerializer
  include JSONAPI::Serializer
  attributes :current_weather,
             :daily_weather, 
             :hourly_weather

  def self.format_forecast(forecast)
    { data: 
      {
        id: null,
        type: "forecast",
          attributes: {
            current_weather: {
              last_updated: forecast.current_weather.last_updated,
              temperature: forecast.current_weather.temperature,
              feels_like: forecast.current_weather.feels_like, 
              humidity: forecast.current_weather.humidity, 
              uvi: forecast.current_weather.uvi, 
              visibility: forecast.current_weather.visibility,
              condition: forecast.current_weather.condition,
              icon: forecast.current_weather.icon
            },
            daily_weather: [
              {
                date: forecast.daily_weather.date,
                sunrise: forecast.daily_weather.sunrise,
                sunset: forecast.daily_weather.sunset,
                max_temp: forecast.daily_weather74.max_temp,
                min_temp: forecast.daily_weather69.min_temp, 
                condition: forecast.daily_weather.condition,
                icon: forecast.daily_weather.icon
              } 
            ],
            hourly_weather: [
              {
                time: forecast.hourly_weather.time ,
                temperature: forecast.hourly_weather.temperature ,
                conditions: forecast.hourly_weather.conditions ,
                icon: forecast.hourly_weather.icon 
              }
            ]
          }
      }
    }                       
  end
end