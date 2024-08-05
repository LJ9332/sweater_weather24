class Forecast 
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather
  
  def initialize(data)
    @current_weather = ForecastCurrent
    @daily_weather = ForecastDaily
    @hourly_weather = ForecastHourly
  end
end