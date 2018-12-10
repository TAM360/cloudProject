Rails.application.routes.draw do
  resources :wish_lists
  resources :posts
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks" }
  get 'home/index'
  get 'others_posts', to: 'posts#other_posts'
  post 'set_ratings', to: 'posts#set_ratings'

  root 'home#index'
end