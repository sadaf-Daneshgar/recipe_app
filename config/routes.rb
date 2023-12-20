Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users

  resources :public_recipes, only: [:index]

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
      get 'shopping_list', on: :member
      resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
    end
  end
end
