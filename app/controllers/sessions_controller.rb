class SessionsController < ApplicationController
  before_action :already_signed_in, except: [:destroy]
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase) # Find the user by email and get it ready for the session
    if user && user.authenticate(params[:session][:password]) # If the user is able to authenticate:
      session[:user_id] = user.id # Get the user's id for the session
       # Use flash to render a message for the user
      redirect_to root_path, notice: "Login Successful" # Redirect the user to a certain page. 
                            # Possible wanted code:
                              # redirect_to user_path(user)
    else # If the user is not able to authenticate:
       # Use flash to render a message for the user
      render 'new', notice: "There was something wrong with your login information" # render the form
    end
  end
  
  def destroy
    session[:user_id] = nil # When the user logs out, reset the user id to nil. 
     # Use flash to render a message for the user
    redirect_to root_path, notice: "You have logged out" # Redirect the user to a certain page
  end
  
end
