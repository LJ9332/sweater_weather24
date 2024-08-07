class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      User.find_by(id: params[:id]) 
      render json: UserSerializer.new(user), status: :ok
    else
      render json: { errors: {details: "Invalid Password"}}, status: :bad_request
    end
  end
end
