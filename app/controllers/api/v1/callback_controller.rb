class Api::V1::CallbackController < Api::V1::BaseController

  def index
    render json: {
      status: "OK",
      message: "Working normally"
    }
  end

end
