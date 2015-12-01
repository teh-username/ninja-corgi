class MainControllerController < ApplicationController
  def index
  end

  def about
  end

  def portfolio
  end

  def contact
    @message = Message.new
  end

  def message
    @is_legit_user = verify_recaptcha
    @message = Message.new(get_message_params)
    if @message.save && @is_legit_user
      flash[:success] = "Thanks! I'll get back right at you at the speed of light!"
      redirect_to action: 'contact'
    else
      flash.now[:danger] = "Please click the little box down there. I have trust issues with bots :(" if !@is_legit_user
      flash.delete("recaptcha_error")
      render 'contact'
    end
  end

  private
    def get_message_params
      params.require(:message).permit(:first_name, :last_name, :email, :subject, :content)
    end
end
