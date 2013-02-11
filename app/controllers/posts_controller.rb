class PostsController < ApplicationController
  before_filter :require_signed_in

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "New Post created!"
      redirect_to @post
    else
      flash[:error] = "Post not created!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
    @comment = @post.comments.build
  end

end
