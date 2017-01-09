Rails.application.routes.draw do


  resources :comments, only: [:create]

  get 'order_guides/create'

  get 'order_guides/update'

  get 'order_guides/destroy'


  get 'carts/show'

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }

  resources :guides
  resources :tours
  resources :order_guides, only: [:create, :update, :destroy]
  root 'grayscales#index'
  resource :cart, only: [:show]
  resources :photos, only: [:index, :show, :new, :create, :destroy]
end
