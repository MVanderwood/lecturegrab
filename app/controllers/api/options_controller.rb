class Api::OptionsController < ApplicationController
  def show
    @user = current_user
  end

  def create
    puts "==============================="
    option = Option.new({
      user_id: params[:user_id],
      subject_id: Subject.find_by(name: params[:subject]).id,
      delivery_interval: params[:delivery_interval],
      delivery_method: params[:delivery_method]
    })
    option[:delivery_time] = option.set_time({time_of_day: params[:time], day: params[:day]})
    p option.delivery_time
  end

  def update

  end

  def destroy

  end
end
