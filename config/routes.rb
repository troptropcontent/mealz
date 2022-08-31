Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  resources :events, only: [:index, :new, :create, :destroy, :show] do
    resources :meals, only: [:new]
  end
  resources :meals, only: [:destroy, :create, :show] do
    resources :courses, only: [:new]
  end
  resources :courses, only: [:create, :destroy, :show, :update] do
    resources :recipes, only: [:new]
  end
  resources :recipes, only: [:new]
 
end
