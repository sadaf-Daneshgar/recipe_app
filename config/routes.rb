Rails.application.routes.draw do
  devise_for :users
 
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :show]
    resources :recipes, only: [:index, :show] do
      resources :recipe_foods, only: [:index, :show]
    end
  end
end
