class LectureMailer < ApplicationMailer

  def self.lecture_email(user, lecture)
    user = user
    lecture = lecture
    mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"]
    message_params = {
      from: ENV["GMAIL_USERNAME"],
      to: user.email,
      subject: "Your lecture on #{lecture.subject.name} has arrived!",
      text: "#{lecture.title.upcase}:\n#{lecture.content}"
    }
    mg_client.send_message(ENV["ACTION_MAILER_DOMAIN"], message_params)
  end
end
