Rails.application.routes.draw do
  resources :genres
  resources :users
  resources :authors
  resources :books

  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
