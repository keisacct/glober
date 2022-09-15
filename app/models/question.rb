class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    is_impressionable


    validates :title, presence: true
    validates :content, presence: true
end
