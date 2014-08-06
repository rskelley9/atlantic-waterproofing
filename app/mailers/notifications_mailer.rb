class NotificationsMailer < ActionMailer::Base

  sender_email_address = "winstedwarrior@gmail.com"

  default :from => sender_email_address
  default :to => "rskelley9@gmail.com"
  default "reply-to" => sender_email_address

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

  # Replace :to, :from and :subject with the address you’d like the email sent to,
  # the address it’s being sent from (should be the one you configured the Rails application with),
  # and the subject of the email.

end
