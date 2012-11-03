class PostsController < ApplicationController

  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.xml
  def index
    @posts = if params[:tag]
      Post.tagged_with(params[:tag])
    else
      Post.scoped
    end
    @posts = @posts.where(:published => true).order("created_at DESC")
    @posts = @posts.paginate(:page => params[:page], :per_page => 4) unless params[:count] == "all"

    respond_to do |format|
      format.html # index.html.erb
      format.rss  { render :layout => false }
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  private

  def find_post
    if params[:id] =~ /^\d+$/
      @post = Post.find(params[:id])
    else
      @post = Post.where(:slug => params[:id]).first
      raise ActiveRecord::RecordNotFound if @post.nil?
    end
  end

end
