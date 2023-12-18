Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :show]
    resources :recipes, only: [:index, :show] do
      resources :recipe_foods, only: [:index, :show]
    end
  end
end
