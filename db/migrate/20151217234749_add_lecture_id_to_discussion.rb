class AddLectureIdToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :lecture_id, :integer
  end
end
