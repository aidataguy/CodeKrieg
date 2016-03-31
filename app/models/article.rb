class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user # An article belongs to an user
  has_many :comments, dependent: :destroy
  
  has_many :article_categories # An article has many categories
  has_many :categories, through: :article_categories # get categories through article_categories
  
  validates :title, presence: true, length: {minimum: 3, maximum:50} # Validates the title, presence and length
  validates :content, presence: true, length: {minimum: 10} # Validates the content, presence and length
  validates :user_id, presence: true # Validates the user id and its presence
  
  # Dropbox - Paperclip - Integration :
  has_attached_file :image,
  storage: :dropbox,
  dropbox_credentials: Rails.root.join('config/dropbox.yml'),
  styles: {featured: "1366x700#", normal: "150x150#", big: "800x600#"},
  dropox_options: {
    path: proc{|style| "#{style}/#{id}_#{image.original_filename}"},  
    unique_filename: true
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  # protected 
  
  # def clean_input
  #   self.input = sanitize(self.input, :tags => %w(h1 h2 h3 h4 h5 h6 p b i u))
  # end
end
