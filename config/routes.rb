Rails.application.routes.draw do
  devise_for :users, path: 'user', path_names: { sign_in: 'login' }, controllers: {
    # omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'user/sessions',
    registrations: 'user/registrations',
    passwords: 'user/passwords'
  }

  get "/dashboard", to: "accounts#dashboard"
  
  get "/account", to: "accounts#index"
  get "/account/:username", to: "accounts#show"

  root "home#index"
  get "contact", to: "home#contact"
  post "contact", to: "home#create"

  
  resources :articles, expect: %i[new] do
    post "/publish", to: "articles#publish"
    post "/unpublish", to: "articles#unpublish"
    post "/rate", to: "articles#rate"
    resources :comments, only: %i[create edit update destroy]
  end

  namespace "api", defaults: { format: "jsonapi" } do
    namespace "v1" do
      resources :articles
      post "login", to: "sessions#create"
      devise_for :user, path: 'user', only: :registrations, controllers: {
        registrations: "api/v1/registrations"
      }
    end
  end
end
