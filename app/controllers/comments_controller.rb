class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  #   @post = Post.find(params[:id])
  # end

  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to Post.find(params[:comment][:post_id])
    else
      flash[:error] = "Comment couldn't be created"
    end
  end

end
