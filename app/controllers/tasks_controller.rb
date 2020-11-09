class TasksController < ApplicationController
  # paginates_per 3
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @sorting = params[:sorting]
    if @sorting
      @tasks = Task.all.order(@sorting).page(params[:page])
    else
      @tasks = Task.all.order(created_at: :desc).page(params[:page])
    end
  end

  def search
    if params[:search_by_title].present? || params[:search_by_status].present?
      @tasks = Task.search(params[:search_by_title], params[:search_by_status])
    else
      redirect_to tasks_path
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
      redirect_to tasks_path
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :expired_at, :status, :priority)
  end
end
