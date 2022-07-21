class Api::V1::CallbackController < Api::V1::BaseController

  def index
    render json: {
      data: {
        status: "OK",
        message: "Working normally"
      }
    }
  end

end
