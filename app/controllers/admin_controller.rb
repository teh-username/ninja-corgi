class AdminController < ApplicationController
  # Use kickass admin layout
  layout "admin"

  def index
  end

  def messages
    # retrieve all message here
    @messages = Message.all.order(id: :desc)
  end
end
