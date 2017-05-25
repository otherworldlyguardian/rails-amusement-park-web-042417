Rails.application.routes.draw do
  root to: 'sessions#index'
  get '/signin' => 'sessions#new', as: 'signin'
  delete '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:index, :create]
  resources :users, only: [:new, :create, :show]
  resources :attractions, except: [:destroy]
  resources :rides, only: [:create]

end
