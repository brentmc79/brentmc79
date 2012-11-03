class Admin::PostsController < ApplicationController

  before_filter :admin_required

  def index
    @posts = Post.paginate(:per_page => 20, :page => params[:page])
  end

  def edit
    @post = Post.find(params[:id])
  end

end
