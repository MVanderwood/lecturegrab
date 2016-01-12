class Api::PostsController < ApplicationController

  def index
    @discussion = Discussion.find_by(id: params[:id])
    @posts = @discussion.posts
    @current_user_role = current_user.role
    @current_user_id = current_user.id
  end

  def create
    discussion = Discussion.find_by(id: params[:id])
    post = Post.new({user_id: params[:userId], discussion_id: discussion.id, content: params[:content]})
    if post.save
      render json: post
    else
      render json: post.errors.full_messages
    end
  end

  def update

  end

  def destroy

  end
end
