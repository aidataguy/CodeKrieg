class Project < ActiveRecord::Base
  belongs_to :user
  
  extend FriendlyId
  friendly_id :project_title, use: :slugged
  
  validates :project_title, presence: true, length: {minimum: 3, maximum:50} # Validates the title, presence and length
  validates :project_content, presence: true, length: {minimum: 10} # Validates the content, presence and length
  validates :project_url, presence: true # Validates the url
  validates :user_id, presence: true # Validates the user id and its presence
  
  # Dropbox - Paperclip - Integration :
  has_attached_file :project_image,
  storage: :dropbox,
  dropbox_credentials: Rails.root.join('config/dropbox.yml'),
  styles: {featured: "1366x700#", normal: "350x350#", big: "800x600#"},
  dropbox_options: {
    path: proc{|style| "#{style}/#{id}_#{project_image.original_filename}"},
    unique_filename: true
  }
  validates_attachment_content_type :project_image, content_type: /\Aimage\/.*\Z/
  
end
