class Task < ApplicationRecord
    belongs_to :group
    belongs_to :user
    validates :text, presence: true
    validates :group_id, presence: true
end
