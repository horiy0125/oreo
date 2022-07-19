class Api::V1::BaseController < ApplicationController
  include ExceptionHandler

  before_action :authenticate_user!


  def allowed_user?
    return current_user.email == ENV["ADMIN_USER_EMAIL"] || current_user.email == ENV["ALLOWED_USER_EMAIL"]
  end

  def allowed_user!
    if allowed_user? == false
      render_403
    end
  end

end
