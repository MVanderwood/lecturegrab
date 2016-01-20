class Lecture < ActiveRecord::Base
  belongs_to :subject
  has_many :discussions
  has_many :lecture_tags
  has_many :user_lectures
  has_many :users, through: :user_lectures
  has_many :tags, through: :lecture_tags

  validates :subject_id, presence: true
  validates :title, presence: true
  validates :title, length: {maximum: 50}
  validates :content, presence: true
  validates :content, length: {minimum: 40}
end
