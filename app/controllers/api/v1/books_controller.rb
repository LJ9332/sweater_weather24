class Api::V1::BooksController < ApplicationController
  def search
    book = BookFacade.new.find_books(params[:location], params[:quantity])
    render json: BookSerializer.new(book)
  end
end