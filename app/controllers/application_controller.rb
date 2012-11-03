class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_required
    true
  end

end
