Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'public_recipes/show'
  root to: "users#index"

  devise_for :users

  resources :public_recipes, only: [:index]

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:index, :show]
    end
  end
end
