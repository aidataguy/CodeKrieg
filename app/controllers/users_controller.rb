class UsersController < ApplicationController
  before_action :already_signed_in, except: [:edit, :update, :show, :destroy]
  before_action :user_id, only: [:show, :edit, :update, :destroy]
  
  def new 
    @user = User.new # Initiates the creation of the user
  end
  
  def create
    @user = User.new(user_params) # Initiates the creation of the user with the same user's params.
    if @user.save # If the user is saved: 
      session[:user_id] = @user.id# Create a new user it for him
      redirect_to root_path, notice: "Welcome to CodeKrieg's blog #{@user.username}"  # After everything is finished, redirect the user to a certain page
                            # Possible wanted code (in case its needed to redirect to the user profile: 
                              # redirect_to user_path(@user)
    else # If the user is not saved:
      render 'new' # Render the form again
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)  # If the user can be updated, update the informations.
      
      redirect_to root_path, notice: "Your account has been updated successfully" # After everything is finished, redirect the user to a certain page
    else
      render 'edit'
    end
  end
  
  def show
    # Possible wanted code: 
      # @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy 
    @user.destroy # Destroy the user User flash to display a message for the user
    redirect_to root_path, notice: "User and all articles created by user have been deleted" # After everything is finished, redirect the user to a certain page
  end
  
  
  private
  
  def user_id
    @user = User.friendly.find(params[:id])
  end  
    
  def user_params 
      params.require(:user).permit(:username, :email, :password, :picture, :slug) # Require the user params needed to submit a post.
  end
end
