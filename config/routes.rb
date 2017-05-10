Enrollment::Engine.routes.draw do
  resources :categories do
    resources :lectures
  end

  resources :lectures do
    resources :enrolls
    resources :lecture_admins
  end

end

if Enrollment.automatic_routes_mount
  Rails.application.routes.draw do
    mount_enrollment_routes
  end
end
