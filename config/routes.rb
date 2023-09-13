Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    # sessions: 'users/sessions'
  }
  # get 'users/new'
  root   'static_pages#home'
  get    "/about",         to: "static_pages#about"
  get    "/microposts",    to: "static_pages#home"

  devise_scope :user do
    get    "/sign_in",  to: "devise/sessions#new"
    post   "/sign_in",  to: "devise/sessions#create"
    delete "/sign_out", to: "devise/sessions#destroy"
    get    "/sign_up",  to: "users/registrations#new"
    post   "/sign_up",  to: "users/registrations#create"
    get    "/edit",     to: "users/registrations#edit"
    delete "/cancel",   to: "users/registrations#cancel"
  end 

  resources :users
  resources :children, only: [:index, :create]
  resources :wishlists, only: [:new, :index, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
end

