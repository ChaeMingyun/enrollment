module Enrollment
  class Enroll < ActiveRecord::Base
    belongs_to :enrollment_lecture, :class_name => 'Enrollment::Lecture'
    belongs_to :users
  end
end
