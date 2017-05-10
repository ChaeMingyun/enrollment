module Enrollment
  class Lecture < ActiveRecord::Base
    belongs_to :category, foreign_key: :enrollment_category_id
    has_many :enrolls, foreign_key: :enrollment_lecture_id
    has_many :lecture_admins, foreign_key: :enrollment_lecture_id
  end
end
