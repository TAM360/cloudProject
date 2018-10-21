Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks" }
  get 'home/index'

  root 'home#index'
  get 'login/create', to: 'third_party_login#create', as: :create_login
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
