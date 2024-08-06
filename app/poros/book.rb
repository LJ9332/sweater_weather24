class Book 
  attr_reader :id,
              :type,
              :destination,
              :forecast,
              :total_books_found,
              :books
  
  def initialize(id = "null", type = "books", destination, forecast, total_books_found, books)
    @id = id
    @type = type
    @destination = destination
    @forecast = forecast
    @total_books_found = total_books_found
    @books = books
  end
end