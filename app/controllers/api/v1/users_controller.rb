class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user_params[:email].nil? || user_params[:password].nil? || user_params[:password_confirmation].nil?
      render json: {errors: {details: "Validation failed: fill in all fields"}}, status: :bad_request
    elsif user_params[:password] != user_params[:password_confirmation]
      render json: {errors: {details: "Password doesn't match Password Confirmation"}}, status: :bad_request
    elsif user.save
      render json: UserSerializer.new(user), status: :created
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end