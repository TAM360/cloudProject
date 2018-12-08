Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks" }
  get 'home/index'
  get 'others_posts', to: 'posts#other_posts'

  root 'home#index'
end