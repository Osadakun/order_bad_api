class Api::V1::Auth::RegistrationsController < ApplicationController
  def
  private
  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
