Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :campaigns
  resources :chapters
  resources :characters
  resources :events
  resources :profiles

  # Defines the root path route ("/")
  root "profiles#show"
end
