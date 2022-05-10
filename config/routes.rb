Rails.application.routes.draw do
  get 'movies_imports/new'
  get 'movies_imports/create'
  root to: 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts


  resources :movies
  resources :movies_imports, only: [:new, :create]

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'more', to: 'posts#more'

  get 'genres', to: 'posts#genres'

  get 'news', to: 'posts#news'

  get 'celebrities', to: 'posts#celebrities'



end
