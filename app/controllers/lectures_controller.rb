class LecturesController < ApplicationController

  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find_by id: params[:id]
  end

  def new
    @subjects = Subject.all
  end

  def create
    lecture = Lecture.create subject_id: params[:subject], title: params[:title], content: params[:content]
    UserLecture.create user_id: current_user.id, lecture_id: lecture.id
    redirect_to "/lectures/#{lecture.id}"
  end

  def edit
    @lecture = Lecture.find_by id: params[:id]
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
end
