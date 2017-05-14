module Enrollment
  class Category < ActiveRecord::Base
    has_many :lectures, foreign_key: :enrollment_category_id, dependent: :nullify
  end
end
