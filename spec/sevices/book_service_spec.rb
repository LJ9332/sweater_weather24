require 'rails_helper'

RSpec.describe BookService do
  it "can find book from location" do
    VCR.use_cassette('book_service_CO'){
      location = BookService.new.find_book("denver,co", 5)
      expect(location).to be_a(Hash)
    }
  end
end