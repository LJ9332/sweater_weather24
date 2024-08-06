require 'rails_helper'

RSpec.describe Search do
  it "exists" do
    VCR.use_cassette('search_poro_CO'){
      destination = 'pueblo,co'
      forecast = {

      }

      restaurant = {

      }

      munchie = Search.new(destination, forecast, restaurant)

      expect(munchie).to be_a(Search)
      expect(munchie.id).to eq('null')
      expect(munchie.type).to eq('munchie')
      expect(munchie.destination_city).to eq(destination)
      expect(munchie.forecast).to eq(forecast)
      expect(munchie.restaurant).to eq(restaurant)
    }
  end
end