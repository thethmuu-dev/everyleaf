class Task < ApplicationRecord
    validates :title, :status, :deadline, :priority, presence: true
end
