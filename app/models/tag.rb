class Tag < ActiveRecord::Base
  has_many :lecture_tags
  has_many :quote_tags
  has_many :lectures, through: :lecture_tags
  has_many :quotes, through: :quote_tags

  validates :title, presence: true, length: { maximum: 30 }
  validates :title, presence: true, length: { minimum: 4 }
end
