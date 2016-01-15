class Subject < ActiveRecord::Base
  has_many :lectures
  has_many :discussions
  has_many :options
  has_many :user_subjects
  has_many :followers, through: :user_subjects, foreign_key: :subject_id
end
