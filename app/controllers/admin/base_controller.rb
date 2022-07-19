class Admin::BaseController < ApplicationController
  include ExceptionHandler

  before_action :authenticate_user!
  before_action :admin_user!


  def admin_user?
    return current_user.email == ENV["ADMIN_USER_EMAIL"]
  end

  def admin_user!
    if admin_user? == false
      render_403
    end
  end

end
