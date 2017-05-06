class EnrollmentCategory < ActiveRecord::Base
  has_many :lectures
end
