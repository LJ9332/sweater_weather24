class MapQuestService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_location(location)
    get_url("/geocoding/v1/address?location=#{location}")
  end

  def find_travel_directions(start_point, end_point)
    get_url("/directions/v2/route?from=#{start_point}&to=#{end_point}")
  end

  private
  def conn
    Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.params["key"] = Rails.application.credentials.api_key[:map_quest]
    end
  end
end