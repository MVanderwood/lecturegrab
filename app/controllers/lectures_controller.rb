class LecturesController < ApplicationController

  def index
    if params[:subject]
      @lectures = Lecture.where(subject_id: params[:subject])
    else
      @lectures = Lecture.all
    end
  end

  def new
    @subjects = Subject.all
  end

  def show
    @lecture = Lecture.find_by id: params[:id]
    unless UserLecture.where("lecture_id = ? AND user_id = ?", @lecture.id, current_user.id)
      UserLecture.create({user_id: current_user.id, lecture_id: @lecture.id, completion_date: DateTime.current}) 
    end
  end

  def edit
    @lecture = Lecture.find_by id: params[:id]
  end

  def create
    lecture = Lecture.create subject_id: params[:subject], title: params[:title], content: params[:content]
    redirect_to "/lectures/#{lecture.id}"
  end

  def update
    lecture = Lecture.find_by id: params[:id] 
    lecture.update title: params[:title], content: params[:content]
    redirect_to "/lectures/#{lecture.id}"
  end

  def destroy
    Lecture.find_by(id: params[:id]).destroy
    redirect_to "/lectures"
  end

  def text
    lecture = Lecture.find_by(id: params[:id])
    client = Twilio::REST::Client.new ENV["TWILIO_API_SID"], ENV["TWILIO_API_KEY"]
    message = client.messages.create({
      # to: "+18167296823",
      to: "+1#{current_user.phone_number}",
      from: "+18168670795",
      body: "#{lecture.title} \n#{lecture.content}"
      # media_url: 
      })
    
    redirect_to "/lectures/#{params[:id]}"
  end
end
