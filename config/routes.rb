Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :articles do
  	 resources :comments

  end

  get 'home/index'

  root 'home#index'

end
