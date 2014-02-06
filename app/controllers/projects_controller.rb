class ProjectsController < ApplicationController
  
  http_basic_authenticate_with name: ENV["USER"], 
                               password: ENV["PASSWORD"], 
                               only: [:new, :edit, :destroy, :update, :index]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end


  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      if params[:project][:image].present?
        render :crop
      else
        redirect_to @project, notice: 'Project was successfully created.'
      end 
    else
      render action: "new" 
    end
    
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      if params[:project][:image].present?
        render :crop
      else
        redirect_to @project, notice: 'Project was successfully updated.'
      end
    else
      render action: "edit"
    end
    
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
