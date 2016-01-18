class QueueJob < ActiveJob::Base
  queue_as :default

  def self.send_lecture(option)




    #UNGODLY QUERY ISSUE ZOMG#
    UserLecture.new({user_id: option.user_id. })
    if option.delivery_method == "Text"
      client = Twilio::REST::Client.new ENV["TWILIO_API_SID"], ENV["TWILIO_API_KEY"]
      message = client.messages.create({
        to: "+18167296823",
        from: "+18168670795",
        body: "Successs!!"
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
