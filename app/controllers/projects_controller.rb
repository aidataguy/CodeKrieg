class ProjectsController < ApplicationController
  before_action :project_id, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show] # Before any action require the user to be admin
   
  def index
    @project = Project.all.order("created_at desc").paginate(:page => params[:page], :per_page => 5)
  end
  
  def show
  
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project), notice: "Project has been saved successfully"
    else
      render 'new', notice: "Seems something is wrong"
    end
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params) # If the project can be updated
       # Render a flash message to the user
      redirect_to project_path(@project), notice: "project Updated Successfully" # Redirect him to the project path
    else # If the project can not be updated
     #Render a flash message to the user 
      render 'edit',  notice: "project Update failed" # Render the form again
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: "project was sucessfully deleted"  # Redirect to the a certain page
                          # Possible wanted code
                            # redirect_to projects_path
  end
  
  private
    def project_params
      params.require(:project).permit(:project_title, :project_content, :project_url, :project_image, :bootsy_image_gallery_id, :slug )
    end
    
    def project_id
      @project = Project.friendly.find(params[:id])
    end
    
    def require_admin
      if !logged_in?
         redirect_to root_path, notice: "Only admin accounts can perform that action!" 
      elsif !current_user.admin?
         redirect_to root_path, notice: "Only admin accounts can perform that action!" 
      end
    end
end
