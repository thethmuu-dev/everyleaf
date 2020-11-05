class Task < ApplicationRecord
    validates :title, :status, :deadline, presence: true
end
