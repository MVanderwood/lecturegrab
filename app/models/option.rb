class Option < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  def add_time(time)
    day = weekday_convert(time[:day])
    hour = time[:time_of_day].split(":")[0].to_i
    minutes = time[:time_of_day].split(":")[1].split(" ")[0].to_i
    m = time[:time_of_day].split(":")[1].split(" ")[1]
    if m == "PM"
      hour += 12
    end
    weekday = weekday_convert(time[:day])
    
  end

  private

  def weekday_convert(day)
    if day == "Sunday"
      ruby_day = 0
    elsif day == "Monday"
      ruby_day = 1
    elsif day == "Tuesday"
      ruby_day = 2
    elsif day == "Wednesday"
      ruby_day = 3
    elsif day == "Thursday"
      ruby_day = 4
    elsif day == "Friday"
      ruby_day = 5
    elsif day == "Saturday"
      ruby_day = 6
    end
    day
  end
end
