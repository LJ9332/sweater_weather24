class BookService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_book(location, quantity)
    get_url("/api/v1/book-search?location=#{location}&quantity=#{quantity}")
  end

  private
  def conn
    Faraday.new(url: "https://openlibrary.org/search.json") do |faraday|
    end
  end
end