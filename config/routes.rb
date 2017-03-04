Rails.application.routes.draw do
  root 'posts#index'

  resources :posts

  post 'posts/unlock', to: 'posts#unlock'
end