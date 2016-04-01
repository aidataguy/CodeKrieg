class WelcomeController < ApplicationController
  def index
     @projects = Project.all.last(6)
     @images = @projects.map(&:project_image)
     @articles = Article.all.last(2)
     @aimages = @articles.map(&:image)
  end
  
end
