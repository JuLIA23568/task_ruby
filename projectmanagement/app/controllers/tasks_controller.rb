class TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: [:edit, :update] 
  before_action :set_task, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :edit, :update]


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
    @task.user_id = current_user.id
    @task.save

    if @task.save
       redirect_to project_path(@project)
       else
        render'new'
    end 
        
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  def update
    
    if @task.update(task_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end



  private

  def find_project
   @project = Project.find(params[:project_id])  
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

   def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:title, :description, :status)
    end

end

