Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root 'checks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'check' => 'checks#check'
  
  resources :cards
  resources :users
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  
  resources :sessions
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
end
