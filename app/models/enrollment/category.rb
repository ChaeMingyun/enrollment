module Enrollment
  class Category < ActiveRecord::Base
    has_many :enrollment_lectures, :class_name => 'Enrollment::Lecture'
  end
end
