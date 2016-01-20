class Api::OptionsController < ApplicationController
  def show
    @user = current_user
    @options = Option.where(user_id: @user.id).order(:delivery_time)
  end

  def create
    option = Option.new({
      user_id: params[:user_id], 
      subject_id: Subject.find_by(name: params[:subject]).id, 
      delivery_interval: params[:delivery_interval], 
      delivery_method: params[:delivery_method]
    })
    option[:delivery_time] = option.set_time({time_of_day: params[:time], day: params[:day]})
    job = QueueJob.delay(run_at: Proc.new { option.delivery_time }).send_lecture(option)
    option.job_id = job.id
    if option.save
      render json: {option: {subject: option.subject.name, deliveryDay: option.readable_weekday, deliveryHour: option.readable_time, deliveryInterval: option.delivery_interval, deliveryMethod: option.delivery_method, id: option.id}}
    else
      Delayed::Job.find_by(id: job.id).destroy
      render json: option.errors.full_messages
    end
  end

  def update
    option = Option.find_by(id: params[:option_id])
    option_updates = {
      subject_id: Subject.find_by(name: params[:subject]).id, 
      delivery_time: option.set_time({time_of_day: params[:time], day: params[:day]}), 
      delivery_interval: params[:delivery_interval], 
      delivery_method: params[:delivery_method]
    }
    if option.update(option_updates)
      Delayed::Job.find_by(id: option.job_id).run_at = option.delivery_time
      render json: {option: {subject: option.subject.name, deliveryDay: option.readable_weekday, deliveryHour: option.readable_time, deliveryInterval: option.delivery_interval, deliveryMethod: option.delivery_method}}
    else
      render json: option.errors.full_messages
    end
  end

  def destroy
    option = Option.find_by(id: params[:option_id])
    option.destroy
    if option.destroyed?
      render json: {message: "Deleted successfully"}
      Delayed::Job.find_by(id: option.job_id).destroy
    else
      render json: option.errors.full_messages
    end
  end
end
