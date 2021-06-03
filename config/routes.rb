Rails.application.routes.draw do
  resources :crafts
  resources :users

  post "/login", to: "users#login"
  get "/profile", to: "users#profile"

end
