Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :campaigns
  resources :chapters
  resources :characters
  resources :events
  resources :profiles
  match "profiles/:old_id/switch_to/:new_id",
    to: "profiles#switch_active_profile",
    as: :switch_active_profile,
    via: [:put, :post, :get]

  # Defines the root path route ("/")
  root "profiles#show"
end
