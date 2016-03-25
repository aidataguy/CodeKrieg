class CommentsController < ApplicationController 
  # all the before actions for comments goes here
  before_action :require_login
  
  def index
    @comment = Comment.all # Renders all the comments
  end
  
  def show
  end
  
  def new
    @comment = Comment.new # Initiates the creation of the comment
  end
  
  def create
    @article = Article.find(params[:comment][:article_id]) # This will look for the Articles by ID
    @comment = @article.comments.build(comment_params) # This will build the comments on the basis of params
    @comment.user = current_user #This will save the User ID
    if @comment.save 
       respond_to do |format| #saves with AJAX
        format.html { redirect_to @article }
        format.js
      end
    end
    
  end
  
  # def edit 
  # end
  
  # def update
  #   @comment = Comment.update(comment_params) # Initiates the edit of the comment with the same params
  #     if @comment.update? # If the comment can be edited 
  #       redirect_to @article_path, notice: "Your comment has been submitted successfully" # Render a flash message to the user
  #     else # If the comment can not be edited 
  #       redirect_to @article_path, notice: "Something went wrong!" # Render a flash message to the user
  #     end
  # end
  
  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    
    def comment_params
      params.require(:comment).permit(:content)
    end
    
    def require_login
      if !logged_in? 
        redirect_to root_path, notice: "Only logged in users can comment!"
      end
    end
    
  end