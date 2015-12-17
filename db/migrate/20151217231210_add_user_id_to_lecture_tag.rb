class AddUserIdToLectureTag < ActiveRecord::Migration
  def change
    add_column :lecture_tags, :user_id, :integer
  end
end
