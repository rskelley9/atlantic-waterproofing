module ApplicationHelper

  def bootstrap_class_for flash_type
    case flash_type
    when :success
        "alert-success" # Green
      when :error
        "alert-danger" # Red
      when :alert
        "alert-warning" # Yellow
      when :notice
        "alert-info" # Blue
      else
        flash_type.to_s
      end
    end

    def message_exists?(message)
      if !(message.nil?) && message.instance_of?(Message)
        true
      else
        false
      end
    end

    def invalid_email_class_for(params_message)
      if message_exists?(params_message) && !(params_message.email.nil?)
        if params_message.invalid? && params_message.errors[:email].any?
         return "has-error"
       else
        return ""
      end
    end
  end

# needs to be DRYed up
  def confirmation_error_for(params_message)
    if message_exists?(params_message)  && !(params_message.email.nil?)
      if params_message.invalid? && params_message.errors[:email_confirmation].any?
        return "has-error"
      else
        return ""
      end
    end
  end

end
