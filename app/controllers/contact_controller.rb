class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    p params
    p "These are my params!!!!!!!!!"

   p @message.errors[:email].any?

    p @message.errors[:email_confirmation].any?

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :success => "Message was successfully sent.")
    else
      flash.now[:error] = "Please fill out all form fields before pressing submit."
      render :new
    end
  end

end
