Rails.application.routes.draw do
  root "home#index"
  get '/login', to: "home#new"
  post '/login', to: 'home#create'
  get "/logout", to: "home#destroy"

  resources :lessions
  resources :courses
  resources :users
  resources :home
end
