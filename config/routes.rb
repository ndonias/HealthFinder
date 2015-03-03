Rails.application.routes.draw do


  get 'users/index'

  get 'users/new'

  get 'users/edit'

  get 'users/show'

  get 'users/update'

  get 'users/create'

  get 'users/delete'

  resources :users

  get 'home/index'

  root 'home#index'

end
