class Search 
  attr_reader :id,
              :type,
              :destination_city,
              :forecast,
              :restaurant
              
  
  def initialize(id = "null", type = "munchie", destination_city, forecast, restaurant)
    @id = id
    @type = type
    @destination_city = destination_city
    @forecast = forecast
    @restaurant = restaurant
  end
end