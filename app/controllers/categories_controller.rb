class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show] # Before any action require the user to be admin
  
  def index
    @categories = Category.all.order("created_at desc").paginate(:page => params[:page], :per_page => 20) # (paginate(page: params[:page], per_page: 5))Renders the categories on the index page. Changes might be needed 
  end
  
  def new
    @category = Category.new # Initiates the creation of a new category
  end
  
  def create
    @category = Category.new(category_params) # Initiates the creation of a new category with the needed params
    if @category.save # If the category is saved
      redirect_to categories_path, notice: "Category as created successfully" # Redirect to a certain page
    else # If the category can not be saved
      render 'new', notice: "Category could not be saved"# Render the form again
    end
  end
  
  def edit
    @category = Category.find(params[:id]) # Initiates the edit of the category by finding it within the params
  end
  
  def update
    @category = Category.find(params[:id]) # Initiates the edit of the category by finding it within the params
    if @category.update(category_params) # If the category can be updated
      redirect_to category_path(@category), notice: "Category name was successfully updated" # redirect to the category page
    else # If the category can not be updated
      # Render a flash message to the user / admin
      render 'edit', notice: "Category name was successfully updated" # Render the form again
    end
  end
  
  def show
    @category = Category.find(params[:id]) # Find the category by its params id
    @article_category = @category.article.paginate(page: params[:page], per_page: 5) # Renders the articles that match the category
                                                                                     # Might not be needed
  end
  
  private 
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !logged_in? and current_user != "admin"
      redirect_to root_path, notice: "Only admin accounts can perform that action!"
    end
  end
  
end