require 'rails_helper'

RSpec.describe 'Road Trip Request' do
  xit "can have a travel time between locations" do
    VCR.use_cassette('road_trip_request_CO') {
      user = User.create!(email: "test@test.com", password: "test123", password_confirmation: "test123", api_key: "jgn976hy48thw9blah98h4538o8")
      
      {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "jgn976hy48thw9blah98h4538o8"
      }
   
      post '/api/v1/road_trip?origin=denver,co&destination=pueblo,co'

      road_trip = JSON.parse(response.body, symbolize_names: true)[:data]
      #binding.pry
      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      expect(road_trip[:id]).to eq("null")
      expect(road_trip[:type]).to eq("road_trip")
      expect(road_trip[:attributes]).to be_a(Hash)
      expect(road_trip[:attributes]).to have_key(:start_city)
      expect(road_trip[:attributes][:start_city]).to be_a(String)
      expect(road_trip[:attributes]).to have_key(:end_city)
      expect(road_trip[:attributes][:end_city]).to eq(String)
      expect(road_trip[:attributes]).to have_key(:travel_time)
      expect(road_trip[:attributes][:travel_time]).to be_a(String)
      expect(road_trip[:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:attributes][:weather_at_eta]).to be_a(Hash)
      expect(road_trip[:attributes][:weather_at_eta]).to have_key(:datetime)
      expect(road_trip[:attributes][:weather_at_eta][:datetime]).to be_a(String)
      expect(road_trip[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(road_trip[:attributes][:weather_at_eta]).to have_key(:condition)
      expect(road_trip[:attributes][:weather_at_eta][:condition]).to be_a(String)
    }
  end
end