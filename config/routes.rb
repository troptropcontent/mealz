Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "events#new"
  resources :events, only: [:index, :new, :create, :destroy, :show] do
    resources :meals, only: [:new]
    resource :shopping_list, only: :show
  end
  resources :meals, only: [:destroy, :create, :show] do
    resources :courses, only: [:new]
  end
  resources :courses, only: [:create, :destroy, :show, :update] do
    resources :recipes, only: [:new]
  end
  resources :recipes, only: [:new]
 
end
