Rails.application.routes.draw do
  resources :users
  resources :cuisines
  root 'store#index', as: 'store_index'

  get 'store/index'

  resources :reviews
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
