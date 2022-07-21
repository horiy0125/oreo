class Api::HealthCheckController < ApplicationController

  def index
    render json: {
      data: {
        status: "OK",
        message: "Working normally"
      }
    }
  end

end
