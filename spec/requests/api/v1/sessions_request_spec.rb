require 'rails_helper'

RSpec.describe "Sessions Request" do
  describe "login" do
    before(:each) do
      @user = User.create!(email: "test@test.com", password: "test123", password_confirmation: "test123") 
    end

    it 'can start a session' do 
      user_params = {
          email: "test@test.com",
          password: "test123"
        }
      
      post "/api/v1/sessions", params: user_params, as: :json

      data = JSON.parse(response.body, symbolize_names: true)[:data]
        
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(data[:attributes][:email]).to eq(@user.email)
      expect(data[:attributes][:api_key]).to_not be_nil
      expect(data).to have_key(:type)
      expect(data[:type].class).to eq(String)
      expect(data).to have_key(:id)
      expect(data[:id].class).to eq(String)
      expect(data).to have_key(:attributes)
      expect(data[:attributes].class).to eq(Hash)
      expect(data[:attributes]).to have_key(:email)
      expect(data[:attributes][:email].class).to eq(String)
      expect(data[:attributes]).to have_key(:api_key)
      expect(data[:attributes][:api_key].class).to eq(String)
    end

    it "returns a 400 error message if inccorect password is given" do
      user_params = {
        email: "test@test.com",
        password: "test1"
      }
 
      post '/api/v1/sessions', params: user_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)
 
      expect(response).not_to be_successful
      expect(response.status).to eq(400)
      expect(json[:errors][:details]).to eq("Invalid Password")
    end
  end
end