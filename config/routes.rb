Rails.application.routes.draw do

  resources :genres
  resources :users
  resources :books
  resources :authors

  resources :books do
    resources :reviews
    resources :ratings
  end
  # possibly nest under user, and/or add read_status? Or add separate user/book nest for use with read_status?



#double check this
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
