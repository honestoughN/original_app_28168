class HeartsController < ApplicationController
  def index
    @hearts = Heart.all
  end
  def new
    @heart = Heart.new
  end
end
