require 'rails_helper'

RSpec.describe YelpService do
  it "can find searched location and food type" do
    VCR.use_cassette('location_search_CO'){
      location = YelpService.new.yelp_search("pueblo,co", "italian")
      expect(location).to be_a(Hash)
    }
  end
end