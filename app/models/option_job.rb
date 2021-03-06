class OptionJob

  def self.send_lecture(option)
    user = User.find_by(id: option.user_id)
    lectures = []
    subject_lectures = Lecture.where(subject_id: option.subject_id)
    subject_lectures.each do |subject_lecture|
      lectures << subject_lecture if subject_lecture.user_lectures.exists?(user_id: option.user_id) == false
    end 
    lecture = lectures.sample
    if option.delivery_method == "Text"
      UserLecture.create({lecture_id: 1, user_id: option.user_id, completion_date: DateTime.current})
      client = Twilio::REST::Client.new ENV["TWILIO_API_SID"], ENV["TWILIO_API_KEY"]
      message = client.messages.create({
        to: "+1#{user.phone_number}",
        from: "+18168670795",
        body: "#{lecture.title.upcase}:\n#{lecture.content}"
        # media_url: 
      })
    elsif option.delivery_method == "Email"
      UserLecture.create({lecture_id: 1, user_id: option.user_id, completion_date: DateTime.current})
      LectureMailer.lecture_email(user, lecture)
    elsif option.delivery_method == "Queue"
      UserLecture.create({lecture_id: 1, user_id: option.user_id})
    end
    # reset_job(option)
  end

  # handle_asynchronously :perform, :run_at => Proc.new {30.seconds.from_now}

  # def delay
  #   run_at: 30.seconds.from_now
  # end

  def self.reset_job(option)
    if option.delivery_interval == "Just Once"
      option.destroy
      return
    elsif option.delivery_interval == "Weekly"
      option.delivery_time += 1.weeks
    elsif option.delivery_interval == "Biweekly"
      option.delivery_time += 2.weeks
    elsif option.delivery_interval == "Monthly"
      option.delivery_time += 4.weeks
    end
    self.delay(run_at: option.delivery_time).send_lecture(option)
  end
end