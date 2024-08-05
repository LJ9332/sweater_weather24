require 'rails_helper'

RSpec.describe MapQuestService do
  it "can find location from lat and lng" do
    VCR.use_cassette('lat_lng_OH'){
      location = MapQuestService.new.find_location("cincinatti,oh")
      expect(location).to be_a(Hash)
    }
  end
end