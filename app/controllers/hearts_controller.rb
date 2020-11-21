class HeartsController < ApplicationController
  def index
    @hearts = Heart.all
  end
end
