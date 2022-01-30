Rails.application.routes.draw do
  resources :users
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/login', to: 'login#index'
  post '/login/on', to: 'login#login'
  get '/logout', to: 'login#logout'
end
