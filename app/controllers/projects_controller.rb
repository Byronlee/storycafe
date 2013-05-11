class ProjectsController < ApplicationController
  def create
    project = Project.new_project(current_user,params[:project])
    session[:current_project] = project
    render :json => project
  end

end
