class BookFacade
  def find_books(location, quantity)
    book_data = BookService.new.find_book(location, quantity)
    destination = book_data[:location]

    forecast = {
      summary: book_data[:summary],
      temperature: book_data[:temperature]
    }
    total_books_found = book_data[:books].count
    books = book_data[:books].map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher][0]
      }
    end

    Book.new(destination, forecast, total_books_found, books)
  end
end