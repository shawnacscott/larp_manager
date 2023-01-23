Rails.application.routes.draw do
  resources :campaigns
  resources :events
  resources :chapters
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :characters
  resources :users

  # Defines the root path route ("/")
  root "home#dashboard"
end
