class UsersController < ApplicationController
  before_action :already_signed_in, except: [:edit, :update, :show, :destroy]
  
  def new 
    @user = User.new # Initiates the creation of the user
  end
  
  def create
    @user = User.new(user_params) # Initiates the creation of the user with the same user's params.
    if @user.save # If the user is saved: 
      session[:user_id] = @user.id # Create a new user it for him
      flash[:success] = "Welcome to CodeKrieg's blog #{@user.username}" # Use flash to display a message for the user
      redirect_to root_path # After everything is finished, redirect the user to a certain page
                            # Possible wanted code (in case its needed to redirect to the user profile: 
                              # redirect_to user_path(@user)
    else # If the user is not saved:
      render 'new' # Render the form again
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params) # If the user can be updated, update the informations.
      flash[:success] = "Your account has been updated successfully" # Use flash to display a message for the user
      redirect_to root_path # After everything is finished, redirect the user to a certain page
    else
      render 'edit'
    end
  end
  
  def show
    # Possible wanted code: 
      # @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
      @user = User.find(params[:id])
  end
  
  def destroy 
    @user = User.find(params[:id]) # Find the user by ID
    @user.destroy # Destroy the user
    flash[:danger] = "User and all articles created by user have been deleted" # User flash to display a message for the user
    redirect_to root_path # After everything is finished, redirect the user to a certain page
  end
  
  
  private
    
    def user_params 
      params.require(:user).permit(:username, :email, :password, :picture) # Require the user params needed to submit a post.
    end
end
