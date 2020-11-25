class HeartsController < ApplicationController
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

  private
  def heart_params
    params.require(:heart).permit(:title, :detail, :category_id).merge(user_id: current_user.id)
  end
end
