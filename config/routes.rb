Rails.application.routes.draw do
  resources :profiles
  resources :campaigns
  resources :events
  resources :chapters
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :characters

  # Defines the root path route ("/")
  root "profiles#show"
end
