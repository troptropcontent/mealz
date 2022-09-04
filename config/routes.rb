Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'events#new'
  resources :events, only: %i[index new create destroy show] do
    resources :meals, only: [:new]
    resource :shopping_list, only: :show
    resources :guests, only: %i[index]
  end
  resources :guests, only: [:create]

  resources :meals, only: %i[destroy create show] do
    resources :courses, only: [:new]
  end
  resources :courses, only: %i[create destroy show update] do
    resources :recipes, only: [:new]
  end
  resources :recipes, only: [:new]
end
