Elcoding::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    post '/login' => 'devise/sessions#create'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :posts do
    resources :paintings
    resources :comments
  end

  resources :pages do
    resources :paintings
  end

  resources :tags

  resources :admin do
    collection do
      get 'comments'
    end
  end

  post "markdown/preview"

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  match 'about' => 'pages#show', :as => 'about', :id => 'ob-avtore-bloga'

  root :to => 'posts#index'

end
