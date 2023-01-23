Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :roles
  resources :campaigns
  resources :chapters
  resources :characters
  resources :events
  resources :users

  # Defines the root path route ("/")
  root "home#dashboard"
end
