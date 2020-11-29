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

  def show
    @heart = Heart.find(params[:id])
  end

  def edit
    @heart = Heart.find(params[:id])
  end

  def update
    @heart = Heart.find(params[:id])
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
  def heart_params
    params.require(:heart).permit(:title, :detail, :category_id).merge(user_id: current_user.id)
  end
end
