class User < ActiveRecord::Base
  
  # User model maintenance 
  before_save { self.email = email.downcase } # Once the user is saved the email will be downcased for easier maintenance.
  
  # User model validations 
  validates :username, presence: true, # Validates the user's username and its the presence. 
            uniqueness: { case_sensitive: false }, # Validates the uniqueness and its not case sensitive.
            length: { minimum: 3, maximum: 25 } # Validates the minimum and maximum characters allowed.
            
                      # Validates the email informations with regex
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/is
  
  validates :email, presence: true, length: { maximum: 105 }, # Validates the user's email and its presence.
            uniqueness: { case_sensitive: false }, # Validates the uniqueness and its not case sensitive.
            format: { with: VALID_EMAIL_REGEX } # Validates the format with regex
  
  has_secure_password # Validates the secure password with bcrypt. 
  
  # User add-on
    # Dropbox - Paperclip - Integration :
  has_attached_file :picture,
  storage: :dropbox,
  dropbox_credentials: Rails.root.join('config/dropbox.yml'),
  styles: {normal: "150x150#", big: "300x300#"},
  dropox_options: {
    path: proc{|style| "#{style}/#{id}_#{image.original_filename}"},  
    unique_filename: true
  }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  
end
