class Admin::BaseController < ApplicationController

  layout "admin"

  http_basic_authenticate_with :name => "brentmc79", :password => "p00pf@c3"

  def index
    redirect_to admin_posts_path
  end

end
