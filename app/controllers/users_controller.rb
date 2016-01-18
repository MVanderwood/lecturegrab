class UsersController < ApplicationController
  def show

  end

  def queue
    @user_lectures = UserLecture.where(user: current_user)
  end
end
