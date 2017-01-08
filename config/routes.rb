Rails.application.routes.draw do

  resources :comments, only: [:create]
  resources :guides
  resources :tours
  resources :users
root 'grayscales#index'

end
