class Contact < MailForm::Base
    attribute :name,      :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message,   :validate => true
    attribute :nickname,  :captcha  => true
    attribute :phone
    attribute :country,   :validate => true
    attribute :budget,    :validate => true
    attribute :website
    attribute :hosting,   :validate => true
    
  def headers
    {
    :subject => "Request A Quote Form",
    :to => "quotes@codekrieg.com",
    :from => %("#{name}" <#{email}>)
    }
  end
end