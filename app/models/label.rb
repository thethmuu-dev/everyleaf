class Label < ApplicationRecord
  belongs_to :user
  has_many :label_tasks
  has_many :taks, through: :label_tasks
end
