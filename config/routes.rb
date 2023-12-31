Rails.application.routes.draw do
  root "user#index"

  resources :users do
    resources :profiles, only: [:create, :update, :destroy]
    resource :follows, only: [ :create, :destroy]
    resources :posts, only: [ :create, :update, :destroy] do 
      resource :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy] 
    end
  end

  post '/auth/login',to: 'authentication#login'

  # get  'posts/id',action: :show, controller: 'posts'

  # get 'posts',to: 'posts#show'

  get '/posts/:id', to: 'posts#show', as: 'post'

end 

