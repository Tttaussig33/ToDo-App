Rails.application.routes.draw do
  get "welcome/index"
  # Root landing page for non-logged-in users
  root "welcome#index"

  # User signup/login/logout routes
  get  "signup",  to: "users#new"
  post "signup",  to: "users#create"
  get  "login",   to: "sessions#new"
  post "login",   to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Users
  resources :users, only: [ :show, :destroy ]

  # Categories and nested todos (for category details showing its todos)
  resources :categories

  # Todos routes (not nested so we can access /todos/completed)
  resources :todos do
    collection do
      get "completed"
    end
  end

  # Health and PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
