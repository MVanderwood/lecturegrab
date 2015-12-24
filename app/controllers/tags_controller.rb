class TagsController < ApplicationController
  def new_lecture_tag
    @lecture = Lecture.find params[:id]
  end

  def create_lecture_tag
    lecture = Lecture.find params[:id]
    tag = Tag.find_by(title: params[:title]) || tag = Tag.create(title: params[:title])
    unless LectureTag.find_by(lecture_id: lecture.id)
      LectureTag.create lecture_id: lecture.id, tag_id: tag.id, user_id: current_user.id
    end
    # unless Tag.find_by(title: params[:title]) && LectureTag.find_by(id: lecture.id)
    #   LectureTag.create lecture_id: lecture.id, tag_id: tag.id, user_id: current_user.id
    # end
    redirect_to "/lectures/#{lecture.id}"
  end
end