class Api::OptionsController < ApplicationController
  def show
    @user = current_user
  end

  def create
    option = Option.new({user_id: params[:user_id], subject_id: Subject.find_by(name: params[:subject]).id, delivery_interval: params[:delivery_interval], delivery_method: params[:delivery_method]})
    option[:delivery_time] = option.set_time({time_of_day: params[:time], day: params[:day]})
    if option.save
      render json: {option: {subject: option.subject.name, deliveryDay: option.readable_weekday, deliveryHour: option.readable_time, deliveryInterval: option.delivery_interval, deliveryMethod: option.delivery_method}}
    else
      render json: option.errors.full_messages
    end
  end

  def update
    puts "======================================================"
    option = Option.find_by(id: params[:option_id])
    option_updates = {subject_id: Subject.find_by(name: params[:subject]).id, delivery_time: option.set_time({time_of_day: params[:time], day: params[:day]}), delivery_interval: params[:delivery_interval], delivery_method: params[:delivery_method]}
    if option.update(option_updates)
      render json: {option: {subject: option.subject.name, deliveryDay: option.readable_weekday, deliveryHour: option.readable_time, deliveryInterval: option.delivery_interval, deliveryMethod: option.delivery_method}}
    else
      render json: option.errors.full_messages
    end
  end

  def destroy

  end
end
