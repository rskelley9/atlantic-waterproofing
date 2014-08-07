class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :first_name, :last_name, :email, :subject, :body

  validates :first_name, :last_name, :email, :email_confirmation, :subject, :body, :presence => true
  validates :email, format: { with: %r{.+@.+\..+}, :allow_blank => false,  message: "%{value} is not a valid email address." }
  validates :email, confirmation: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end