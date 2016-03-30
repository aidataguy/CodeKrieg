class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver 
      #
    else
      render :new, notice: "Can not send message"
    end
  end
end
