module Enrollment
  class LectureAdmin < ActiveRecord::Base
    belongs_to :lecture, foreign_key: :enrollment_lecture_id
  end
end
