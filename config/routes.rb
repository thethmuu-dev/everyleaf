Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    get '/users', to: 'users#index'
    get '/toggle/:id', to: 'users#toggle'
    post '/users', to: 'users#create'
    resources :users, except: [:new, :index]
  end

  resources :tasks
  get '/search', to: 'tasks#search'
  root 'sessions#new'

  resources :labels
end
