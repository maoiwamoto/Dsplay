Rails.application.routes.draw do
  
  devise_for :admin_users, skip: :all
  devise_for :admin_users, only: %i(sign_in sign_out session)
  namespace :admin do
      resources :users
      resources :articles
      resources :posts
      resources :profs
      resources :tags
      root to: "users#index"
  end
    
    
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
  end
  
  resources :users, :only => [:index]
  resources :posts, :articles, :tags, :expect => [:index]
  
  resource :prof,only:[:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
  get 'home' => 'home#index'
  get 'terms' => 'home#terms', as: 'terms'
  get 'privacy' => 'home#privacy', as: 'privacy'
  get 'howto' => 'home#howto', as: 'howto'
  get 'about' => 'home#about', as: 'about'
  get 'contact' => 'home#contact', as: 'contact'
  get 'guide' => 'home#guide', as: 'guide'
  get 'users/mypage' => 'users#mypage'
  get 'users/:id' => 'users#show', as: 'me'
  get 'users/:id/posts' => 'posts#her_index', as: 'her_posts'
  get 'users/:id/tags' => 'tags#her_index', as: 'her_tags'
  get 'users/:id/articles' => 'articles#her_index', as: 'her_articles'
  
end
