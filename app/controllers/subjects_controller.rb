class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def new
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find_by(id: params[:id])
  end

  def edit
    @subject = Subject.find_by(id: params[:id])
  end

  def create
    subject = Subject.create name: params[:name], description: params[:description]
    redirect_to "/subjects/#{subject.id}"
  end

  def update
    subject = Subject.find_by id: params[:id]
    subject.update name: params[:name], description: params[:description]
    redirect_to "/subjects"
  end

  def destroy
    Subject.find_by(id: params[:id]).destroy
    redirect_to "/subjects"
  end

  def follow
    subject = Subject.find_by(id: params[:id])
    UserSubject.create({user_id: current_user.id, subject_id: subject.id})
    flash[:success] = "Now following #{subject.name}!"
    redirect_to "/subjects"
  end

end
