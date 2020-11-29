class HeartsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  before_action :set_heart, only: [:show, :edit, :update]
  def index
    @hearts = Heart.all
  end

  def new
    @heart = Heart.new
  end

  def create
    @heart = Heart.new(heart_params)
    if @heart.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @heart.comments.includes(:user)
  end

  def edit
  end

  def update
    if @heart.update(heart_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    heart = Heart.find(params[:id])
    heart.destroy
    redirect_to root_path
  end
  private
  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def heart_params
    params.require(:heart).permit(:title, :detail, :category_id).merge(user_id: current_user.id)
  end

  def set_heart
    @heart = Heart.find(params[:id])
  end
end
