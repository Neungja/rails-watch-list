Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]

  # get '/lists/:list_id/bookmarks/new', to: 'bookmarks#new'
  # post '/lists/:list_id/bookmarks', to: 'bookmarks#create'
  # delete '/bookmarks/:id', to: 'bookmarks#destroy'

  # get '/lists', to: 'lists#index'
  # get '/lists/new', to: 'lists#new'
  # get '/lists/:id', to: 'lists#show'
  # post '/lists', to: 'lists#create'

  # Defines the root path route ("/")
  # root "posts#index"
  # root "home#index"

  root 'welcome#index'
end
