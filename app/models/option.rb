class Option < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  attr_reader :weekday_config

  @@weekday_config = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  def set_time(time)
    datetime = DateTime.parse(time[:time_of_day])
    weekday = @@weekday_config.index(time[:day])
    datetime += ((weekday - datetime.wday) % 7) - 1
    if datetime < DateTime.current
      datetime += 1.week
    end
    datetime
  end

  private

  def weekday_convert(day)
    if day == "Saturday"
      ruby_day = 0
    elsif day == "Sunday"
      ruby_day = 1
    elsif day == "Monday"
      ruby_day = 2
    elsif day == "Tuesday"
      ruby_day = 3
    elsif day == "Wednesday"
      ruby_day = 4
    elsif day == "Thursday"
      ruby_day = 5
    elsif day == "Friday"
      ruby_day = 6
    end
    ruby_day
  end
end
