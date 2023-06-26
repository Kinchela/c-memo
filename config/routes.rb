Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # get 'users/new'
  root 'static_pages#home'
  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  # get  "/show",    to: "users#show"
  # get  "/signup",  to: "users#new"
  # get  "/sign_up",  to: "users/registrations#new"

  devise_scope :user do
    get  "/sign_up",  to: "users/registrations#new"
  end 
  resources :users
end
