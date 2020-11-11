class Task < ApplicationRecord
  before_validation :sample_details
  validates :title, :status, :expired_at, :priority, presence: true

  belongs_to :user

  # enum priority: { Low: 0, Medium: 1, High: 2 }

  scope :search, ->(title, status) {
    @name_param = title.to_s.downcase
    @status_param = status.to_s.downcase

    if @name_param.present? && @status_param.blank?
    where("lower(title) LIKE ?", "%#{@name_param}%")

    elsif @status_param.present? && @name_param.blank?
    where("lower(status) LIKE ?", "%#{@status_param}%")

    elsif @name_param.present? && @status_param.present?
    where("lower(title) LIKE ? AND lower(status) LIKE ?",
                                "%#{@name_param}%", "%#{@status_param}%")
    end
  }

  private
  def sample_details
    if details.blank?
      self.details = 'Description of the Task'
    end
  end
end
