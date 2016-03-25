class Category < ActiveRecord::Base
  has_many :article_categories # A category can have many article through the article categories.
  has_many :article, through: :article_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 } # Validates the presence of the name and its length
  validates_uniqueness_of :name #Validates the uniqueness of the game
end
