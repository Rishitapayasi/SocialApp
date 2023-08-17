Rails.application.routes.draw do
  root "posts#index"

  resources :users 
  resources :profiles 
  resources :users do
    resources :posts ,only: [ :create , :update ,:destroy]
  end
end
