module Enrollment
  class Lecture < ActiveRecord::Base
    has_many :enrollment_enrolls, :class_name => 'Enrollment::Enroll'
    has_many :enrollment_lecture_admins, :class_name => 'Enrollment::LectureAdmin'
  end
end
