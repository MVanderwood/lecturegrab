class Quote < ActiveRecord::Base
  belongs_to :user
  has_many :quote_tags
  has_many :tags, through: :quote_tags
end
