Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'events#new'
  resources :events, only: %i[index new create destroy show] do
    resources :meals, only: [:new]
    resource :shopping_list, only: :show
    resources :guests, only: %i[index]
    resources :brigades, only: %i[index]
  end
  resources :guests, only: %i[create destroy]
  resources :brigades, only: %i[create destroy]

  resources :meals, only: %i[destroy create update show] do
    resources :courses, only: [:new]
  end
  resources :courses, only: %i[create destroy show update]
  resources :recipes, only: %i[new]
end
