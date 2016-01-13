class Api::PostsController < ApplicationController

  def index
    @discussion = Discussion.find_by(id: params[:id])
    @posts = @discussion.posts.order(:id)
    @current_user_role = current_user.role
    @current_user_id = current_user.id
  end

  def create
    discussion = Discussion.find_by(id: params[:id])
    post = Post.new({user_id: params[:userId], discussion_id: discussion.id, content: params[:content]})
    if post.save
      render json: {userId: post.user_id, userHandle: post.user.handle, content: post.content}
    else
      render json: post.errors.full_messages
    end
  end

  def update
    post = Post.find_by(id: params[:post_id])
    if post.update({content: params[:content]})
      render json: {content: post.content}
    else
      render json: post.errors.full_messages
    end
  end

  def destroy

  end
end
