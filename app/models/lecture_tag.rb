class LectureTag < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :tag
end