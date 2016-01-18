class Option < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  attr_reader :weekday_config

  @@weekday_config = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  def set_time(time)
    datetime = Time.zone.parse(time[:time_of_day]).to_datetime
    puts "======================================================"
    puts "======================================================"
    puts datetime
    puts "======================================================"
    puts "======================================================"
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