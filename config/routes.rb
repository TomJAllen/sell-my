Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "searches#index"
  # Defines the root path route ("/")
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/search", to: "searches#search"

end
