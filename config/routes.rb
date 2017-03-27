Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :appearances, only: [:new, :create, :edit, :update, :show, :destroy]

  root 'static#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get '/register', to: 'user#new', as: 'register'
end
