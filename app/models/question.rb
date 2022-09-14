class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    is_impressionable
end
