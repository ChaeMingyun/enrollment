if Enrollment.automatic_routes_mount
  Enrollment::Engine.routes.draw do
    mount_enrollment_routes
    resources :categories, as: :enrollment_categories do
      resources :lectures, as: :enrollment_lectures do
        resources :enrolls, as: :enrollment_enrolles
        resources :lecture_admins, as: :enrollment_lecture_admins
      end
    end
  end
end
