Rails.application.routes.draw do
  post '/login', to: 'sessions#login'
  post '/logout', to: 'sessions#logout'

  resources :users, only: [:create, :show], path_names: { create: "signup" }

  resources :notes, only: [:new, :create, :show, :edit, :update, :destroy]
end
