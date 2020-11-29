class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @email = current_user.email
    @hearts = current_user.hearts
    end
end
