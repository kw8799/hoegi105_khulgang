class Review < ActiveRecord::Base
    belongs_to :classofhot
    has_many :replies
    has_many :proscons
    
end
