require 'rails_helper'

describe "Yelp API" do
  it "returns city destination, forecast, and restaurant details" do 
    VCR.use_cassette('yelp_api_CO') {
      get '/api/v1/munchies?destination=pueblo,co&food=italian'

      expect(response).to be_successful
      
      destination = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(destination).to have_key(:id)
      expect(destination[:id]).to eq("null")
      expect(destination).to have_key(:type)
      expect(destination[:type]).to eq("munchie")

      expect(destination).to have_key(:attributes)
      expect(destination[:attributes]).to be_a(Hash)
      expect(destination[:attributes]).to have_key(:destination_city)
      expect(destination[:attributes][:destination_city]).to be_a(String)
      
      expect(destination[:attributes]).to have_key(:forecast)
      expect(destination[:attributes][:forecast]).to be_a(Hash)

      expect(destination[:attributes][:forecast]).to have_key(:summary)
      expect(destination[:attributes][:forecast][:summary]).to be_a(String)
      expect(destination[:attributes][:forecast]).to have_key(:temperature)
      expect(destination[:attributes][:forecast][:temperature]).to be_a(Integer)

      expect(destination[:attributes]).to have_key(:restaurant)
      expect(destination[:attributes][:restaurant]).to be_a(Hash)

      expect(destination[:attributes][:restaurant]).to have_key(:name)
      expect(destination[:attributes][:restaurant][:name]).to be_a(String)
      expect(destination[:attributes][:restaurant]).to have_key(:address)
      expect(destination[:attributes][:restaurant][:address]).to be_a(String)
      expect(destination[:attributes][:restaurant]).to have_key(:rating)
      expect(destination[:attributes][:restaurant][:rating]).to be_a(Integer)
      expect(destination[:attributes][:restaurant]).to have_key(:reviews)
      expect(destination[:attributes][:restaurant][:reviews]).to be_a(Integer)
    }
  end
end