class WeatherService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def daily_forecast(lat, lng)
    # 5 day limit
    get_url("/v1/forecast.json?q=#{lat},#{lng}&days=5")
  end
  
  private
  def conn
   Faraday.new(url: "http://api.weatherapi.com") do |faraday|
    faraday.params['key'] = Rails.application.credentials.api_key[:weather]
    end 
  end
end