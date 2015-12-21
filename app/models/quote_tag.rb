class QuoteTag < ActiveRecord::Base
  belongs_to :user
  # Join-table
  belongs_to :quote
  belongs_to :tag
end
