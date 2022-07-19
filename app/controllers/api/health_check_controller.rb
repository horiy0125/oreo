class Api::HealthCheckController < ApplicationController

  def index
    api_health = {
      status: "OK",
      message: "Working normally"
    }

    render json: {
      api_health: api_health
    }
  end

end
