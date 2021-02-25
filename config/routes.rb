Rails.application.routes.draw do
  
  
    devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }
  
    devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "verify", :to => "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  
    resources :posts, :articles, :tags
  
  resource :prof,only:[:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
  get 'home/' => 'home#index'
  get 'users/mypage' => 'users#mypage'
  get 'users/:id' => 'users#show', as: 'me'
  get 'users/:id/posts' => 'posts#her_index', as: 'her_posts'
  get 'users/:id/tags' => 'tags#index', as: 'her_tags'
  get 'users/:id/articles' => 'articles#index', as: 'her_articles'
  
end
