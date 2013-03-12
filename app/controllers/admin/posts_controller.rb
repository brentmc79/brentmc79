class Admin::PostsController < Admin::BaseController

  before_filter :admin_required

  def index
    @posts = Post.order("created_at DESC").paginate(:per_page => 20, :page => params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, :notice => "Post successfully created."
    else
      render :action => "new"
    end
  end

  def edit
    @post = Post.find(:slug => params[:id])
  end

  def destroy
    Post.where(:slug => params[:id]).destroy_all
    redirect_to admin_path, :notice => "Post deleted."
  end

end
