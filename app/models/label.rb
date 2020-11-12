class Label < ApplicationRecord
  belongs_to :user
  has_many :label_tasks
  has_many :tasks, through: :label_tasks
  # before_validation { name = name.downcase! }

  validates :name, presence: true
end
