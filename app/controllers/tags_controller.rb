class TagsController < ApplicationController
  def new_lecture_tag
    @lecture = Lecture.find params[:id]
  end

  def create_lecture_tag
    lecture = Lecture.find params[:id]
    tag = Tag.find_by(title: params[:title]) || tag = Tag.create(title: params[:title])
    p tag
    if LectureTag.where("lecture_id = ? and tag_id = ?", lecture.id, tag.id).blank?
      LectureTag.create(lecture_id: lecture.id, tag_id: tag.id, user_id: current_user.id)
    end
    redirect_to "/lectures/#{lecture.id}"
  end
end