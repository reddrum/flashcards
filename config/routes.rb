Rails.application.routes.draw do
  root 'checks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post 'check' => 'checks#check'
  resources :cards
end
