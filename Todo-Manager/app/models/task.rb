class Task < ApplicationRecord
    belongs_to :group
    validates :text, presence: true
    validates :group_id, presence: true
end
