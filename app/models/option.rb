class Option < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  attr_reader :weekday_config, :delivery_time

  @@weekday_config = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  def set_time(time)
    datetime = Time.zone.parse(time[:time_of_day]).to_datetime
    weekday = @@weekday_config.index(time[:day])
    datetime += ((weekday - datetime.wday) % 7) - 1
    if datetime < DateTime.current
      datetime += 1.week
    end
    datetime
  end

  def readable_time
    delivery_time.strftime("%l:%M %p")
  end

  def readable_weekday
    delivery_time.strftime("%A")
  end

  def add_job_and_save
    return_value = save
    if return_value
      QueueJob.delay(run_at: delivery_time).send_lecture(self)
    end
    return_value
  end
end




