class QueuesController < ApplicationController
  def show
    @user_lectures = User.find_by(id: current_user.id).user_lectures.where(completion_date: nil).order(:created_at)
  end
end
