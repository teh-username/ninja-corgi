class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    legit_user = verify_recaptcha
    if legit_user && user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_path
    else
      flash.now[:danger] = 'Invalid credentials'
      flash.delete("recaptcha_error")
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
