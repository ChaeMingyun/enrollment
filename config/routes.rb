Enrollment::Engine.routes.draw do
  resources :lecture_admins
  resources :enrolls
  resources :lectures
  resources :categories
end
