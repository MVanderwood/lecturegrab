class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :quotes
  has_many :lecture_tags
  has_many :user_lectures
  has_many :user_subjects
  has_many :lectures, through: :user_lectures
  has_many :subjects, through: :user_subjects
  
end
