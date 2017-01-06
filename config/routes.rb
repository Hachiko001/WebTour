Rails.application.routes.draw do

  get 'carts/show'

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  resources :guides
  resources :tours


root 'grayscales#index'
resource :cart, only: [:show] do
put 'add/:guide_id', to: 'carts#add', as: :add_to
put 'remove/:guide_id', to: 'carts#remove', as: :remove_from
end
end
