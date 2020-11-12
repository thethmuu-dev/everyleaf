class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :require_owner, only: [:edit, :update, :destroy]

  def show

  end

  private
  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:title, :details, :expired_at, :status, :priority, label_ids: [])
  end

  def require_owner
    if current_user != @label.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own labels"
      redirect_to @label
    end
  end
  
end
