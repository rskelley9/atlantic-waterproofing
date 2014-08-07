class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :first_name, :last_name, :email, :subject, :body, :phone

  validates :first_name, :last_name, :email, :email_confirmation, :subject, :body, presence: true
  validates :email, format: { with: %r{.+@.+\..+}, allow_blank: false,  message: "%{value} is not a valid email address." }
  validates :email, confirmation: { message: "%{value} does not match the email addres you provided. Please fix them and try again." }
  validates :body, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :phone, :presence => true, :numericality => true, length: { :minimum => 10, :maximum => 15, too_short: "is too short (minimum is 10 numerical characters)." }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end