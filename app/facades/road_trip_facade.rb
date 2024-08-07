class RoadTripFacade
  def find_road_trip(start_point, end_point)
    map_data = MapQuestService.new.find_location(end_point) #returns hash with location
    lat = map_data[:results][0][:locations][0][:latLng][:lat] # find lat in nested hash
    long = map_data[:results][0][:locations][0][:latLng][:lng] # find long in nested hash
    forecast_data = WeatherService.new.daily_forecast(lat, long) # returns hash with 5 day forecast (includes current weather)
    travel_data = MapQuestService.new.find_travel_directions(start_point, end_point)
 
    start_city = start_point
    end_city = end_point

    travel_time = travel_data[:route][:time]
    
    if travel_time.nil?
      return Roadtrip.new(start_city, end_city, "impossible route", {})
    else
      formatted_travel_time = travel_data[:route][:formattedTime]
      arrival_time = Time.now + travel_time #find weather at this time
   
      # iterate all the days, make sure dates match
      # iterate through all the hours, and find the hour that matches the arrival time
      # create a hash with the data from that hour
      forecast_data[:forecast][:forecastday].each do |day|
        next unless arrival_time.to_s.include?(day[:date])
      
        day[:hour].each do |hour|
          hour_time = Time.parse(hour[:time])
          if arrival_time.between?(hour_time, hour_time + 1.hour)
            weather_at_eta = {
              datetime: hour[:time],
              temperature: hour[:temp_f],
              condition: hour[:condition][:text]
            }
            return RoadTrip.new(start_city, end_city, formatted_travel_time, weather_at_eta)
          end
        end
      end
    end
  end
end
