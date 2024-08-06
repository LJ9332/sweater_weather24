require 'rails_helper'

RSpec.describe SearchFacade do
  it "can get a searched object" do
    VCR.use_cassette('forecast_cincinatti_OH') {
      location = "pueblo,co"
      food_type = "italian"
    
      munchie = SearchFacade.new.find_search(location, food_type)
    
      expect(munchie).to be_a(Search)
      expect(munchie).to have_key(:destination)
      expect(munchie).to have_key(:forecast)
      expect(munchie).to have_key(:restaurant)

      expect(munchie.forecast).to have_key(:summary)
      expect(munchie.forecast).to have_key(:temperature)

      expect(munchie.restaurant).to have_key(:name)
      expect(munchie.restaurant).to have_key(:address)
      expect(munchie.restaurant).to have_key(:rating)
      expect(munchie.restaurant).to have_key(:reviews)
      
    }
  end
end