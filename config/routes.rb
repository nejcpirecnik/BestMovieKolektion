Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'more', to: 'posts#more'

  get 'genres', to: 'posts#genres'

  get 'news', to: 'posts#news'

  get 'celebrities', to: 'posts#celebrities'



end
