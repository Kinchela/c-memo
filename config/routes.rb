Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get 'users/new'
  root   'static_pages#home'
  get    "/help",          to: "static_pages#help"
  get    "/about",         to: "static_pages#about"
  get    "/contact",       to: "static_pages#contact"
  get    "/children",      to: "children#index"
  get    "/wishlists",     to: "wishlists#index"
  get    "/wishlists/new", to: "wishlists#new"
  get    "/microposts",    to: "static_pages#home"

  devise_scope :user do
    get    "/sign_up",  to: "users/registrations#new"
    get    "/sign_in",  to: "devise/sessions#new"
    post   "/sign_in",  to: "devise/sessions#create"
    delete "/sign_out", to: "devise/sessions#destroy"
    get    "/edit",     to: "users/registrations#edit"
  end 

  resources :users
  resources :children, only: [:index, :create]
  resources :wishlists
  resources :microposts, only: [:create, :destroy]
end
