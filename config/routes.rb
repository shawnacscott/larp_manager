Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    get "users/:id/edit", to: "users/registrations#edit", as: :edit_user
    resources "users", to: "users/registrations#update", as: :users, only: [ :patch, :put ]
  end

  resources :roles
  resources :campaigns
  resources :chapters
  resources :characters
  resources :events
  resources :users, only: [ :index, :show ]

  # Defines the root path route ("/")
  root "dashboard#show"
end
