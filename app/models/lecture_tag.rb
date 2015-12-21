class LectureTag < ActiveRecord::Base
  belongs_to :user
  # Join-table
  belongs_to :lecture
  belongs_to :tag
end