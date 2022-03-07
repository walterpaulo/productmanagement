Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/login', to: 'sessions#index'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
