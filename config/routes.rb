Enrollment::Engine.routes.draw do
  resources :categories do
    resources :lectures do
      resources :lecture_admins, :enrolls
    end
  end
  resources :lectures do
    resources :lecture_admins, :enrolls
  end
  resources :users do
    resources :lecture_admins, :enrolls
  end
end
