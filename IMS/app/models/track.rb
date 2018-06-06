class Track < ApplicationRecord
    has_many :courses, :through => :coursestudenttracks
    has_many :students, :through => :coursestudenttracks

    has_many :students, :through => :lists
    has_many :courses, :through => :coursesTracks
    
    has_many :staffs, :through => :coursestafftracks
    has_many :courses, :through => :coursestafftracks
end
