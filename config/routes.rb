Rails.application.routes.draw do

  resources :guides
  resources :tours
  resources :users
root 'grayscales#index'

end
