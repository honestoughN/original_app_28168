class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @hearts = current_user.hearts
    end
end
