Rails.application.routes.draw do
  root "home#index"
  get '/login', to: "home#new"
  post '/login', to: 'home#create'
  get "/logout", to: "home#destroy"

  resources :answers
  resources :questions
  resources :tasks
  resources :lessions
  resources :lessions_courses
  resources :courses
  resources :users
  resources :home
  resources :users_courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
