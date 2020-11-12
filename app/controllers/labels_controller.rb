class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :require_owner, only: [:edit, :update, :destroy]

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @label.user = current_user
    if @label.save
      flash[:notice] = "Label Added"
      redirect_to label_path(@label.id)
    else
      render :new
    end
  end
  
  def index
    @labels = current_user.labels
  end

  def show
    @tasks = @label.tasks
  end

  def edit

  end

  def update
    if @label.update(label_params)
      flash[:notice] = "Label Edited"
      redirect_to @label
    else
      render 'edit'
    end
  end

  def destroy
    if @label.destroy
      flash[:notice] = "Label Deleted"
      redirect_to labels_path
    end
  end

  private
  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name)
  end

  def require_owner
    if current_user != @label.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own labels"
      redirect_to @label
    end
  end
  
end
