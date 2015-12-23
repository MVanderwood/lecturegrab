class Discussion < ActiveRecord::Base
  belongs_to :subject#, class_name: "Subject", foreign_key: :subject_id
  belongs_to :lecture
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  has_many :posts

  has_many :discussion_followers
  has_many :followers, through: :discussion_followers, foreign_key: :discussion_id
end 
