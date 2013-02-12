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
      flash[:error] = "Comment couldn't be created" # something I like
      # to do is to add :messages to all my validations. Then, when something
      # fails, you can do:
      # flash.now[:errot] = @comment.errors.full_messages.first
      # that will grab a custom error message when validations fail
    end
  end

end
