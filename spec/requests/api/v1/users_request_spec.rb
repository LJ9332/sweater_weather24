require 'rails_helper'

describe "can create a new user" do
  it "returns a new user" do
    user_params = ({
      email: "test@test.com",
      password: "test123",
      password_confirmation: "test123"
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params:  user_params.to_json
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(data[:data][:attributes][:email]).to eq(user_params[:email])
    expect(data[:data][:attributes][:api_key]).to_not be_nil

    # expect(response).to be_successful
    # expect(created_user.email).to eq(user_params[:email])
    # expect(created_user.password).to eq(user_params[:password])
    # expect(created_user.password_digest).to eq(user_params[:password_digest])
  end

  it "returns a 422 status and error message when missing any required attribute" do  
    user_params = ({
      email: "",
      password: "test123",
      password_confirmation: "test123"
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(422)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:errors]).to be_an(Array)
    expect(data[:errors].first[:status]).to eq("422")
    expect(data[:errors].first[:title]).to eq("Validation failed: Email can't be blank")
  end

  it "returns a 400 status and error message if password don't match" do
    user_params = ({
      email: "test@test.com",
      password: "test12",
      password_confirmation: "test123"
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:errors]).to be_an(Array)
    expect(data[:errors].first[:status]).to eq("400")
    expect(data[:errors].first[:title]).to eq("Confirm password doesn't match Password")
  end
end