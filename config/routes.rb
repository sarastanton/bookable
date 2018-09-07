Rails.application.routes.draw do

  resources :read_statuses
  resources :genres
  resources :users
  resources :books
  resources :authors

  resources :users do
    resources :books do
      resources :read_statuses
    end
  end

  resources :books do
    resources :reviews
    resources :ratings
  end

  get '/login' => 'sessions#new'
  get '/auth/goodreads' => 'sessions#create'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'


  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
