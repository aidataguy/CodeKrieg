class ArticlesController < ApplicationController 
  before_action :set_article_id, only: [:show, :edit, :update, :destroy]
  before_action :show_comments, only: [:show, :index]
  before_action :article_users, only: [:index, :show]
  # before_action :auth_admin, except: [:index, :show] # Before any action require the user to be admin
  before_action :require_admin, except: [:index, :show] # Before any action require the user to be admin
  
  def index
    @article = Article.all.order("created_at desc").paginate(:page => params[:page], :per_page => 5) # Lists all the articles in oder
    @category = Category.all
  end
  
  def show
  end
  
  def new
    @article = Article.new # Initiates the creation of a new article
  end
  
  def create
    @article = Article.new(article_params) # Initiates the creation of a new article with the specific params
    @article.user = current_user
    if @article.save# If the article is saved Render a flash message to the user
      redirect_to article_path(@article), notice: "Article Created Successfully" # Redirect to the article path
    else # If the article is not saved
      render 'new',  notice: "Article could not be saved!"  # Render the form again
    end
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params) # If the article can be updated
       # Render a flash message to the user
      redirect_to article_path(@article), notice: "Article Updated Successfully" # Redirect him to the article path
    else # If the article can not be updated
     #Render a flash message to the user 
      render 'edit',  notice: "Article Update failed" # Render the form again
    end
  end
  
  def destroy
    @article.destroy
    redirect_to root_path, notice: "Article was sucessfully deleted"  # Redirect to the a certain page
                          # Possible wanted code
                          # redirect_to articles_path
  end

  private
  
    def article_params
      params.require(:article).permit(:title, :content, :image, :bootsy_image_gallery_id, :slug, category_ids: [])
    end
    
    def set_article_id
      @article = Article.friendly.find(params[:id])
    end
    
    def show_comments
      @comment = Comment.all
    end
    
    def article_users
  	  @user = User.all
    end
  	
    def require_admin
      if !logged_in?
         redirect_to root_path, notice: "Only admin accounts can perform that action!" 
      elsif !current_user.admin?
         redirect_to root_path, notice: "Only admin accounts can perform that action!" 
      end
    end
    
    # def auth_admin
    #   if !current.user =  !current_user.admin?
       
    #   end
    # end

end