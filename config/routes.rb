Rails.application.routes.draw do
  # Defines the root path route ("/")
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "session#destroy"


  get "/dashboard", to: "sessions#show"
  root "home#index"
end
