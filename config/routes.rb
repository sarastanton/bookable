Rails.application.routes.draw do

  resources :genres
  resources :users
  resources :books
  resources :authors

  resources :books do
    resources :reviews
  end

  resources :books do
    resources :ratings
  end



#double check this
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
