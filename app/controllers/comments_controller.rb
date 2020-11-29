class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/hearts/#{comment.heart.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, heart_id: params[:heart_id])
  end
end
