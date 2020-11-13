class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @sorting = params[:sorting]
    if @sorting
      @tasks = current_user.tasks.all.order(@sorting).page(params[:page])
    else
      @tasks = current_user.tasks.all.order(created_at: :desc).page(params[:page])
    end
  end

  def search
    if params[:search_by_title].present? || params[:search_by_status].present?
      @tasks = Task.search(params[:search_by_title], params[:search_by_status])
    elsif params[:search_by_label].present?
      @tasks = Label.find(params[:search_by_label]).tasks
    else
      redirect_to tasks_path
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = "Task Added"
      redirect_to task_path(@task.id)
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task Edited"
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = "Task Deleted"
      if current_user.is_admin?
        redirect_to admin_users_path
      else
        redirect_to tasks_path
      end
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :expired_at, :status, :priority, label_ids: [])
  end

  def require_owner
    if current_user != @task.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own tasks"
      redirect_to @task
    end
  end
end
