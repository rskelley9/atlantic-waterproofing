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

    def invalid_email_class_for(message)
      if message.nil? || !(message.instance_of?(Message))
        ""
      end
      if message.invalid? && message.errors[:email].any?
        "has-error"
      else
        ""
      end
    end


  end
