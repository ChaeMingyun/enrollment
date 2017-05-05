class EnrollmentLecture < ActiveRecord::Base
    belongs_to :enrollment_category
    has_many :enrollment_enrolls
    has_many :enrollment_lecture_admins
end
