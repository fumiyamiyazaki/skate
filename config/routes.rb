Rails.application.routes.draw do
  
  devise_for :users
  root to: 'topics#index'

  resources :topics do
  end
  resources :users, only: [:show, :edit, :update]
end
