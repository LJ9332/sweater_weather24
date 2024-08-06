require 'rails_helper'

describe "Book API" do
  it "sends books by location" do 
    VCR.use_cassette('book_search_CO') {
      get '/api/v1/book-search?location=denver,co&quantity=5'

      expect(response).to be_successful
      
      books = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful

      expect(books).to have_key(:id)
      expect(books[:id]).to eq("null")
      expect(books).to have_key(:type)
      expect(books[:type]).to eq("books")

      expect(books).to have_key(:attributes)
      expect(books[:attributes]).to be_a(Hash)
      expect(books[:attributes]).to have_key(:destination)
      expect(books[:attributes][:destination]).to be_a(String)
      expect(books[:attributes]).to have_key(:forecast)
      expect(books[:attributes][:forecast]).to be_a(Hash)
      expect(books[:attributes][:forecast]).to have_key(:summary)
      expect(books[:attributes][:forecast][:summary]).to be_a(String)
      expect(books[:attributes][:forecast]).to have_key(:temperature)
      expect(books[:attributes][:forecast][:temperature]).to be_a(String)
      expect(books[:attributes]).to have_key(:total_books_found)
      expect(books[:attributes][:total_books_found]).to be_a(Integer)
      expect(books[:attributes]).to have_key(:books)
      expect(books[:attributes][:books]).to be_a(Array)
      expect(books[:attributes][:books][0]).to be_a(Hash)
      expect(books[:attributes][:books][0]).to have_key(:isbn)
      expect(books[:attributes][:books][0][:isbn]).to be_a(Array)
      expect(books[:attributes][:books][0][:isbn][0]).to be_a(String)
      expect(books[:attributes][:books][0][:isbn][1]).to be_a(String)
      expect(books[:attributes][:books][0]).to have_key(:title)
      expect(books[:attributes][:books][0][:title]).to be_a(String)
      expect(books[:attributes][:books][0]).to have_key(:publisher)
      expect(books[:attributes][:books][0][:publisher]).to be_a(Array)
      expect(books[:attributes][:books][0][:publisher][0]).to be_a(String)
    }
  end
end