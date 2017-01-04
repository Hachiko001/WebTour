Rails.application.routes.draw do

  devise_for :users
  resources :guides
  resources :tours
  
root 'grayscales#index'

end
