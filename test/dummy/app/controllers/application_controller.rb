class ApplicationController < ActionController::Base
	helper_method :admin_signed_in?
  def admin_signed_in?
    true
  end
end
