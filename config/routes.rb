Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get 'users/new'
  root   'static_pages#home'
  get    "/help",     to: "static_pages#help"
  get    "/about",    to: "static_pages#about"
  get    "/contact",  to: "static_pages#contact"

  devise_scope :user do
    get  "/sign_up",  to: "users/registrations#new"
    get    "/sign_in",  to: "devise/sessions#new"
    post   "/sign_in",  to: "devise/sessions#create"
    delete "/sign_out", to: "devise/sessions#destroy"

  end 
  resources :users
end
