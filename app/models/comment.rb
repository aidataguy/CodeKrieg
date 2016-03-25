class Comment < ActiveRecord::Base
  
  has_many :article_comments
  belongs_to :article
  belongs_to :user
  
  
  validates :content, presence: true # Validates the presence of the content
end
