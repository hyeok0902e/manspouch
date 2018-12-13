class Comment < ApplicationRecord
  # validation
  validates :body, :presence => true
  
  belongs_to :content
  belongs_to :user
end
