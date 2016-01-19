class QueueJob < ActiveJob::Base
  queue_as :default

  def self.send_lecture(option)
    user = User.find_by(id: option.user_id)
    lectures = []
    subject_lectures = Lecture.where(subject_id: option.subject_id)
    subject_lectures.each do |subject_lecture|
      unattended_lectures << subject_lecture if subject_lecture.user_lectures.exists?(user_id: option.user_id) == false
    end 
    lecture = lectures.sample
    if option.delivery_method == "Text"
      UserLecture.create({lecture_id: lecture.id, user_id: option.user_id, completion_date: DateTime.current})
      client = Twilio::REST::Client.new ENV["TWILIO_API_SID"], ENV["TWILIO_API_KEY"]
      message = client.messages.create({
        to: "+1#{user.phone_number}",
        from: "+18168670795",
        body: "#{lecture.title.upcase}:\n#{lecture}"
        # media_url: 
      })
    elsif option.delivery_method == "Email"

    elsif option.delivery_method == "Queue"

    end
  end

  private

  def reset_job(option)

  end
end
