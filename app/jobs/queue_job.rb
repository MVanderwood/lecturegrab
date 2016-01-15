class QueueJob < ActiveJob::Base
  queue_as :default

  # def self.text_lecture
  #   client = Twilio::REST::Client.new ENV["TWILIO_API_SID"], ENV["TWILIO_API_KEY"]
  #   message = client.messages.create({
  #     to: "+18167296823",
  #     from: "+18168670795",
  #     body: "Successs!!"
  #     # media_url: 
  #     })
  # end

  def self.test
    puts Time.now
  end
end
