class HomeController < ApplicationController
  def index
    render json: {user: "aa"}
  end
end
