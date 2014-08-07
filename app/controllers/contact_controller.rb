class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :success => "Message was successfully sent.")
    else
      flash.now[:error] = "Please fill out all fields before pressing submit."
      render :new
    end
  end

end
