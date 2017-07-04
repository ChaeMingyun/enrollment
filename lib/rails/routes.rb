module ActionDispatch::Routing
  class Mapper
    def mount_enrollment_routes(options = {})
      mount Enrollment::Engine => '/enrollment', :as => options[:as] || 'enrollment'
    end
  end
end
