class DiscussionFollower < ActiveRecord::Base
  belongs_to :follower, class_name: "User", foreign_key: :follower_id
  belongs_to :followed_discussion, class_name: "Discussion", foreign_key: :discussion_id
end 
