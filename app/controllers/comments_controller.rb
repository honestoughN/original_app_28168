class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    heart = Heart.find(params[:heart_id])
    user_name = current_user.nickname
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, heart: heart, user_name: user_name
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, heart_id: params[:heart_id])
  end
end
