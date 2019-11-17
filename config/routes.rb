Rails.application.routes.draw do
  # get 'books/create'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  devise_for :users

 # get '/' => 'home#top', as: 'home'
 get '/home/about' => 'home#about', as:'about'

 root 'home#top'
 resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
 resources :users, only: [:index, :show, :edit, :update, :destroy]

end
