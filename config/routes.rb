Rails.application.routes.draw do
  
  devise_for :users
  root to: 'topics#index'

  resources :topics do
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only:[:create, :destroy]

end
