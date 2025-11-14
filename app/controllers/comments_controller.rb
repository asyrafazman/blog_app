class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :create ]
  before_action :set_comment, only: [ :destroy ]
  before_action :authorize_user!, only: [ :destroy ]

  # POST /post/:post_id/comments
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: "Comment was successfully added."
    else
      redirect_to @post, alert: "Unable to add comment. Please try again."
    end
  end

  # DELETE /comments/:id
  def destroy
    post = @comment.post
    @comment.destroy
    redirect_to post, notice: 'Comment was successfully deleted.'
  end

  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_user!
    unless @comment.user == current_user
      redirect_to @comment.post, alert: "You are not authorized to delete this comment."
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
