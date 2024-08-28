class YelpService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def yelp_search(location, food)
    get_url("/v3/businesses/search?location=#{location}&categories=#{food}")
  end
  
  private
  def conn
   Faraday.new(url: "https://api.yelp.com") do |faraday|
    faraday.headers['Authorization'] = "Bearer #{Rails.application.credentials.api_key[:yelp]}"
    end 
  end
end