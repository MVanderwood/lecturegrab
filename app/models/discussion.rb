class Discussion < ActiveRecord::Base
  belongs_to :subject
  belongs_to :lecture
  belongs_to :user, class_name: :owner
end
