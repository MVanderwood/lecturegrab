class RemoveUserIdFromLectureTag < ActiveRecord::Migration
  def change
    remove_column :lecture_tags, :user_id, :integer
  end
end
