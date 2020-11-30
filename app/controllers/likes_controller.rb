class LikesController < ApplicationController
  before_action :set_heart

  def create
    @like = Like.new(user_id: current_user.id, heart_id: @heart.id)
    @like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, heart_id: @heart.id)
    @like.destroy
  end

  private
  def set_heart
    @heart = Heart.find_by(id: params[:heart_id])
  end
end
