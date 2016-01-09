class Api::TagsController < ApplicationController
  def index_lecture_tag
    @lecture = Lecture.find_by(id: params[:id])
    @tags = @lecture.tags
    @current_user_role = current_user.role
    @current_user_id = current_user.id
  end

  def index_discussion_tag
    @discussion = Discussion.find_by(id: params[:id])
    @tags = @discussion.tags
    @current_user_role = current_user.role
    @current_user_id = current_user.id
    @owner_id = @discussion.owner.id
  end

  def create_lecture_tag
    lecture = Lecture.find params[:id]
    tag = Tag.find_by(title: params[:title]) || tag = Tag.create(title: params[:title])
    p tag
    if LectureTag.where("lecture_id = ? and tag_id = ?", lecture.id, tag.id).blank?
      LectureTag.create(lecture_id: lecture.id, tag_id: tag.id, user_id: current_user.id)
    end
  end
end