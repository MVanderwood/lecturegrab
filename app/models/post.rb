class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :discussion

  validates :discussion_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
  # validates :content, presence: true, length: { minimum: 30 }

end
