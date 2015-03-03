Rails.application.routes.draw do


  
  resources :users
  resources :comments

  get 'home/index'

  root 'home#index'

end
