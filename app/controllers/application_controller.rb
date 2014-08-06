class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  alias :std_redirect_to :redirect_to
  def redirect_to(*args)
   flash.keep
   std_redirect_to *args
 end
end
