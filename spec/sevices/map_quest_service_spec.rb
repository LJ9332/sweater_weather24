require 'rails_helper'

RSpec.describe MapQuestService do
  it "can find location from lat and lng" do
    VCR.use_cassette('lat_lng_OH'){
      location = MapQuestService.new.find_location("cincinatti,oh")
      expect(location).to be_a(Hash)
    }
  end

  it "can find travel time between two locations" do
    VCR.use_cassette('map_quest_service_travel_CO') {
      travel_time = MapQuestService.new.find_travel_directions("denver,co", "boulder,co")
      expect(travel_time).to be_a(Hash)
    }
  end
end