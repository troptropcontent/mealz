Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  resources :events, only: [:index, :new, :create, :destroy, :show] do
    resources :meals, only: [:new]
  end
  resources :meals, only: [:destroy, :create, :show]
end
