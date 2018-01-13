class Group < ApplicationRecord
    has_many :tasks, dependent: :destroy
end
