class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
    @post = params[:id]
  end

  def create_comment
    comment = Comment.new
    comment.content = params[:content]
    comment.user_id = current_user.id
    comment.post_id = params[:post_id]
    comment.save

    redirect_to post_path(params[:post_id]), notice: 'new comments'
  end

  def destroy_comment
    comment = Comment.find(params[:comment_id])
    comment.destroy

    redirect_to post_path(params[:post_id]), notice: 'comment destroyed'
  end
end
