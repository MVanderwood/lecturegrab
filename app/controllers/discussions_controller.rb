class DiscussionsController < ApplicationController

 def index
    @discussions = Discussion.all
  end

  def new
    @subjects = Subject.all
  end

  def show
    @discussion = Discussion.find_by id: params[:id]
  end

  def edit
    @discussion = Discussion.find_by id: params[:id]
  end

  def create
    discussion = Discussion.create({title: params[:discussionTitle], content: params[:discussionContent], owner_id: current_user.id})
    redirect_to "/discussions/#{discussion.id}"
  end

  def update
    discussion = Discussion.find_by id: params[:id] 
    discussion.update title: params[:title], content: params[:content]
    redirect_to "/discussions/#{discussion.id}"
  end

  def destroy
    Discussion.find_by(id: params[:id]).destroy
    redirect_to "/discussions"
  end
end
