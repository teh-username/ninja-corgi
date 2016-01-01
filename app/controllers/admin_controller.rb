class AdminController < ApplicationController
  # Filter those who can access these parts
  before_action :logged_in_user

  # Use kickass admin layout
  layout "admin"

  def index
  end

  def messages
    # retrieve all message here
    @messages = Message.all.order(id: :desc)
  end

  private

  def logged_in_user
    unless logged_in?
      redirect_to root_url
    end
  end
end
