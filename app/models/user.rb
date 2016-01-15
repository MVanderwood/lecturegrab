class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :quotes#, class_name: "Quote", foreign_key: :user_id
  has_many :owned_discussions, class_name: "Discussion", foreign_key: :owner_id
  has_many :posts

  has_many :lecture_tags
  has_many :quote_tags
  has_many :user_lectures
  has_many :user_subjects
  has_many :options
  has_many :discussion_followers, foreign_key: :follower_id
  has_many :followed_discussions, through: :discussion_followers, foreign_key: :follower_id
  has_many :lectures, through: :user_lectures
  has_many :subjects, through: :user_subjects
end
