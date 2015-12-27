class Lecture < ActiveRecord::Base
  belongs_to :subject
  has_many :discussions
  has_many :lecture_tags
  has_many :user_lectures
  has_many :users, through: :user_lectures
  has_many :tags, through: :lecture_tags
end
