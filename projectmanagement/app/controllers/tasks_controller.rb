class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:show, :index]


 def index
    @tasks = Task.all.order("created_at DESC")
  end

   def show
   end

 def edit
   
  end


  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)

  
        redirect_to project_path(@project)
        
  end

 

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
 
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end



  private
   def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:title, :description, :status)
    end

end

