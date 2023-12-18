Rails.application.routes.draw do
  devise_for :users
 
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :public_recipes, only: [:index]
end
