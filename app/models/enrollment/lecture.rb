module Enrollment
  class Lecture < ActiveRecord::Base
    has_many :users, through: :enrolls
    has_many :users, through: :lecture_admins
  end
end
