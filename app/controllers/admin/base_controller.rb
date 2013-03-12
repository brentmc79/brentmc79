class Admin::BaseController < ApplicationController

  layout "admin"

  http_basic_authenticate_with :name => ENV['USERNAME'], :password => ENV['PASSWORD']

  def index
    redirect_to admin_posts_path
  end

end
