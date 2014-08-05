require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module AltaJuly
	class Application < Rails::Application


		if Rails.env.development?

			config.action_mailer.smtp_settings = {
				:address              => "smtp.gmail.com",
				:port                 => 587,
				:domain               => "yourdomain.dev",
				:user_name            => ENV["GMAIL_USERNAME_DEV"],
				:password             => ENV["GMAIL_USERNAME_PRO"],
				:authentication       => :plain,
				:enable_starttls_auto => true
			}
		end


		if Rails.env.production?
			config.action_mailer.smtp_settings = {
				:address              => "smtp.gmail.com",
				:port                 => 587,
				:domain               => "altawp.com",
				:user_name            => ENV["GMAIL_USERNAME_DEV"],
				:password             => ENV["GMAIL_USERNAME_PRO"],
				:authentication       => :plain,
				:enable_starttls_auto => true
			}
		end

		config.action_mailer.default_url_options = {
			:host => "yourdomain.dev"
		}

	end
end
