class Option < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  
  # validates :user_id, presence: true, numericality: { only_integer: true }
  # validates :subject_id, presence: true, numericality: { only_integer: true }
  # validates :job_id, presence: true, numericality: { only_integer: true }
  # validates :delivery_time, presence: true
  # validates :delivery_interval, presence: true
  # validates :delivery_interval, inclusion: { in: ["Just Once", "Weekly", "Biweekly", "Monthly"] }
  # validates :delivery_method, presence: true
  # validates :delivery_method, inclusion: { in: ["Text", "Email", "Queue"]}

  attr_reader :weekday_config

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
end