require 'rails_helper'

RSpec.describe RoadTripFacade do
  it "can have a object" do
    VCR.use_cassette('road_trip_facade_denver_co') {
      roadtrip = RoadTripFacade.new.find_road_trip("Denver,CO", "Boulder,CO")
      expect(roadtrip).to be_a(RoadTrip)
    }
  end
end