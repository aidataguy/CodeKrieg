class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver 
      redirect_to root_path, notice: "Thanks, we will get back to you ASAP"
    else
      render :new, notice: "Can not send message"
    end
  end
end
