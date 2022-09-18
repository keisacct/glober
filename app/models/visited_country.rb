class VisitedCountry < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    belongs_to :country

    acts_as_taggable
    acts_as_taggable_on :countries
end
