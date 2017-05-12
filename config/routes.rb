Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :posts

  post 'posts/unlock', to: 'posts#unlock'
end
