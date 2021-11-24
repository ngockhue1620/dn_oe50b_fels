Rails.application.routes.draw do
  root "home#index"
  get '/login', to: "home#new"
  post '/login', to: 'home#create'
  delete "/logout", to: "home#destroy"

  resources :home
end
