class Api::TagsController < ApplicationController
  def index_lecture_tag
    @lecture = Lecture.find_by(id: params[:id])
    @lecture_tags = @lecture.lecture_tags
    @current_user_role = current_user.role
    @current_user_id = current_user.id
  end

  def create_lecture_tag
    lecture = Lecture.find params[:id]
    tag = Tag.find_by(title: params[:title]) || tag = Tag.create(title: params[:title])
    
    if LectureTag.where("lecture_id = ? and tag_id = ?", lecture.id, tag.id).blank?
      lecture_tag = LectureTag.new(lecture_id: lecture.id, tag_id: tag.id, user_id: params[:user_id])
      if lecture_tag.save
        render json: { title: tag.title, tagId: tag.id, confirmed: lecture_tag.confirmed? }
      else
        render json: { errors: lecture_tag.errors.full_messages }
      end
    else
      render json: { errors: "This lecture already has that tag!" }
    end
  end

  def confirm_lecture_tag
    lecture_tag = LectureTag.where("lecture_id = ? and tag_id = ?", params[:id], params[:tag_id])[0]
    if lecture_tag.update({"confirmed?" => true})
      render json: { message: "Tag confirmed." }
    else
      render json: { errors: lecture_tag.errors.full_messages }
    end
  end

  def destroy_lecture_tag
    lecture_tag = LectureTag.where("lecture_id = ? and tag_id = ?", params[:id], params[:tag_id])[0]
    lecture_tag.destroy
    if lecture_tag.destroyed?
      render json: { message: "Tag removed."}
    else
      render json: { errors: lecture_tag.errors.full_messages }
    end
  end
end