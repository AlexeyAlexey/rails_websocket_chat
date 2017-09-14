Rails.application.routes.draw do

  get 'users/show'
  root "users#show"

  devise_for :users
  
  
  resources :messages
  resources :chatrooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
