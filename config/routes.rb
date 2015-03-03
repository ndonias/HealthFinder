Rails.application.routes.draw do


  
  devise_for :users
  resources :users
  resources :comments

  get 'home/index'

  root 'home#index'

end
