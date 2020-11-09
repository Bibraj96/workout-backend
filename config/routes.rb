Rails.application.routes.draw do
  post "/api/v1/signup", to: "api/v1/users#create"
  post "/api/v1/login", to: "api/v1/sessions#create"
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"

  namespace :api do
    namespace :v1 do
      resources :exercises
      resources :workouts
      resources :users
    end
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
