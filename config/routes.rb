Rails.application.routes.draw do
  
  devise_for :users
  resources :articles
  resources :posts
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resource :user
  resource :prof,only:[:new,:create,:edit,:update]
  
  get 'users/:id' => 'users#show'
  get 'user/:id' => 'users#show'
  
end
