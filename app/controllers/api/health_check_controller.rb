class Api::HealthCheckController < ApplicationController

  def index
    render json: {
      status: "OK",
      message: "Working normally"
    }
  end

end
