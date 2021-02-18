Rails.application.routes.draw do
  
  devise_for :users
  resources :articles
  resources :posts
  resources :tags
  resource :prof,only:[:new,:create,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  get 'users/:id' => 'users#show'
  get 'user/:id' => 'users#show'
  get 'users/:id/tags' => 'tags#index'
  get 'users/:id/posts' => 'posts#index'
  get 'users/:id/articles' => 'articles#index'
  
end
