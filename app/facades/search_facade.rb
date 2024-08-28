class SearchFacade
  def find_search(location, food)
    location_data = MapQuestService.new.find_location(location)
    #binding.pry
    lat = location_data[:results][0][:locations][0][:latLng][:lat]
    lng = location_data[:results][0][:locations][0][:latLng][:lng]
    weather_data = WeatherService.new.daily_forecast(lat, lng)
    munchie_data = YelpService.new.yelp_search(location, food)
    city = munchie_data[:businesses][0][:location][:city]
    state_code = munchie_data[:businesses][0][:location][:state]

    destination =  "#{city},#{state_code}"
    
    forecast = {
      summary: weather_data[:current][:condition][:text],
      temperature: weather_data[:current][:temp_f].to_i
    }
    restaurants =
    {
      name: munchie_data[:businesses][0][:name],
      address: munchie_data[:businesses][0][:location][:display_address][-1],
      rating: munchie_data[:businesses][0][:rating].to_i,
      reviews: munchie_data[:businesses][0][:review_count].to_i
    } 

    Search.new(destination, forecast, restaurants)
  end
end