class Tag < ActiveRecord::Base
    has_and_belongs_to_many :articles

    scope :is_article, -> {where(:is_article => true)}
end
