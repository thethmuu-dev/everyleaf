class Task < ApplicationRecord
    validates :title, :status, :expired_at, :priority, presence: true
end
